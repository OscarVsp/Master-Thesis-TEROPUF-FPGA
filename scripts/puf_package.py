import time
import numpy as np
import serial

import math
from tqdm import tqdm

import logging

class SyndromeNotSetException(Exception):
    pass

def data2bits(data):
	bits = np.zeros(len(data) * 8, np.uint8)
	for i in range(len(data)):
		b = data[i]
		for j in range(8):
			bits[i * 8 + j] = b % 2
			b >>= 1
	return bits

def hamming_dist(a, b):
	return int(np.sum((a + b) % 2))

def bits2str(bits):
	return ''.join(map(str, reversed(bits)))

def str2bytes(bitstring):
	Nbytes = math.ceil(len(bitstring) / 8)
	return int(bitstring, 2).to_bytes(Nbytes, 'little')

def int2bytes(integer):
	binary = bin(integer)[2:]
	return str2bytes("0"*(16 - len(binary)) + binary)




class PUF:
    
    raw_size = 1023
    ecc_size = 171
    syndrome_size = 84
    sha256_size = 256
    
    class ReturnData:
    
        def __init__(self, samples : list, size : int) -> None:
            self.samples = samples
            self.reference = [0 for _ in range(size)]
            self.uniformity = 0
            for sample in tqdm(samples, desc=f"[ANALYSE]", leave = False, ncols=100):
                for bit_i in range(size):
                    self.reference[bit_i] += sample[bit_i]
            for i,reference_bit in enumerate(self.reference):
                self.reference[i] = round(reference_bit/len(samples))
                self.uniformity += self.reference[i]
            self.uniformity = self.uniformity / size

    def __init__(self, port: str, baudrate: int = 230400, initial_ref_limit: int = 200, uart_port_delay: float = 0.1):
        self.port = port
        self.baudrate = baudrate
        self.uart_port_delay = uart_port_delay
        self.set_ref_limit(initial_ref_limit)
        logging.debug("PUF device initialized")
        logging.debug(f"| Port: {port}\n| Baudrate: {baudrate}\n| Ref counter limit: {initial_ref_limit}\n| Uart port delay: {uart_port_delay}")
        
    @property
    def ref_limit(self) -> int:
        return self._ref_limit
        
    @property
    def syndrome(self) -> bytes:
        if hasattr(self, '_syndrome'):
            return self._syndrome
        else:
            raise SyndromeNotSetException("Attribut 'syndrome' is not set")
        
        
    def set_syndrome(self, syndrome: str):
        if not isinstance(syndrome,str):
            raise TypeError("Syndrome argument should be an str.")
        elif not len(syndrome) == self.syndrome_size:
            raise ValueError(f"Syndrome size should be {self.syndrome_size}")
        self._syndrome = str2bytes(syndrome)
        logging.debug(f"Syndrome set to {syndrome}")
        
    def set_ref_limit(self, limit: int):
        if not isinstance(limit, int):
            raise TypeError("Argument 'limit' of method 'set_ref_limit' should be an int")
        if limit >= 65536 or limit <= 0:
            raise ValueError("Argument 'limit' of method 'set_ref_limit' should be a positif integer lower than '65 536'")

        with serial.Serial(self.port, self.baudrate) as ser:
            time.sleep(self.uart_port_delay)
            ser.write(b'c')
            ser.write(int2bytes(limit))
            self._ref_limit = limit
        logging.debug(f"Ref counter limit set to {limit}")
            
    def read_raw(self, response_size: int = None, sample_size: int = 1) -> ReturnData:
        logging.debug(f"Starting raw read...")
        samples = []
        
        if response_size is None:
            response_size = self.raw_size
        elif response_size > self.raw_size or response_size >= 0:
            raise ValueError(f"response_size should be lower or equal than {self.raw_size}.")
            
        response_Nbytes = math.ceil(response_size / 8)
            
        with serial.Serial(self.port, self.baudrate) as ser:
            time.sleep(self.uart_port_delay)
            for _ in tqdm(range(sample_size), desc=f"[READ RAW](ref limit={self.ref_limit})", leave = False, ncols=100):
                ser.write(b'p')
                samples.append(data2bits(ser.read(response_Nbytes))[:response_size])
                
        logging.debug(f"Raw read completed")
        return PUF.ReturnData(samples, response_size)
                
    def read_ecc(self, sample_size: int = 1):
        logging.debug(f"Starting ecc read...")
        if not hasattr(self, '_syndrome'):
            raise SyndromeNotSetException("Syndrome need to be set before using the method 'read_ecc'.")
        samples = []
        response_Nbytes = math.ceil(self.ecc_size / 8)
        with serial.Serial(self.port, self.baudrate) as ser:
            time.sleep(self.uart_port_delay)
            for _ in tqdm(range(sample_size), desc=f"[READ ECC](ref limit={self.ref_limit})", leave = False, ncols=100):
                ser.write(b's')
                ser.write(self.syndrome)
                samples.append(data2bits(ser.read(response_Nbytes))[:self.ecc_size])
        logging.debug(f"Ecc read completed")
        return PUF.ReturnData(samples, self.ecc_size)
        
    def read_sha256(self, sample_size: int = 1):
        logging.debug(f"Starting sha read...")
        if not hasattr(self, '_syndrome'):
            raise SyndromeNotSetException("Syndrome need to be set before using the method 'read_sha256'.")
        samples = []
        response_Nbytes = math.ceil(self.sha256_size / 8)
        with serial.Serial(self.port, self.baudrate) as ser:
            time.sleep(self.uart_port_delay)
            for _ in tqdm(range(sample_size), desc=f"[READ SHA256](ref limit={self.ref_limit})", leave = False, ncols=100):
                ser.write(b'k')
                ser.write(self.syndrome)
                samples.append(data2bits(ser.read(response_Nbytes))[:self.sha256_size])
        logging.debug(f"Sha256 read completed")
        return PUF.ReturnData(samples, self.sha256_size)
    
if __name__ == "__main__":
    puf = PUF('COM4')
    print("Setting ref limit to 300.")
    puf.set_ref_limit(300)
    print("Setting ref limit back to 200.")
    puf.set_ref_limit(200)
    print("Reading raw puf...")
    returnDataRaw = puf.read_raw(sample_size=100)
    print(f"RAW PUF 0 :\n{''.join([str(i) for i in returnDataRaw.samples[0]])}")
    print(f"REFERENCE :\n{''.join([str(i) for i in returnDataRaw.reference])}")
    print(f"UNIFORMITY : {returnDataRaw.uniformity}")
    puf.set_syndrome(str(input("Syndrome ? ")))
    returnDataECC = puf.read_ecc()
    print(f"ECC PUF 0 :\n{''.join([str(i) for i in returnDataECC.samples[0]])}")
    print(f"REFERENCE :\n{''.join([str(i) for i in returnDataECC.reference])}")
    print(f"UNIFORMITY : {returnDataECC.uniformity}")
    returnDataSHA = puf.read_sha256()
    print(f"SHA PUF 0 :\n{''.join([str(i) for i in returnDataSHA.samples[0]])}")
    print(f"REFERENCE :\n{''.join([str(i) for i in returnDataSHA.reference])}")
    print(f"UNIFORMITY : {returnDataSHA.uniformity}")