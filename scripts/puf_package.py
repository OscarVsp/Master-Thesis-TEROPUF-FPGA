import time
from typing import List
import numpy as np 
import serial
import hashlib
from Crypto.Cipher import AES
from base64 import b64decode, b64encode

import math
from tqdm import tqdm

import logging

class SyndromeNotSetException(Exception):
    pass

def bytes2bits(data: bytes, size: int = None) -> np.ndarray[np.uint8]:
    bits = np.zeros(len(data) * 8, np.uint8)
    for i in range(len(data)):
        b = data[i]
        for j in range(8):
            bits[i * 8 + j] = b % 2
            b >>= 1
    if size != None:
        if size > len(data) * 8:
            raise ValueError(f"Specified size is not valid. Bit data max size is {len(data) * 8}.")
        return bits[:size]
    else:
	    return bits

def bits2bytes(data: np.ndarray[np.uint8]) -> bytes:
    return str2bytes(bits2str(data))

def bits2str(bits: np.ndarray[np.uint8]) -> str:
	return ''.join(map(str, reversed(bits)))

def str2bits(bitstring: str) -> np.ndarray[np.uint8]:
    return bytes2bits(str2bytes(bitstring), size=len(bitstring))

def str2bytes(bitstring: str) -> bytes:
	Nbytes = math.ceil(len(bitstring) / 8)
	return int(bitstring, 2).to_bytes(Nbytes, 'little')

def bytes2str(data: bytes, size: int = None) -> str:
    return bits2str(bytes2bits(data, size=size))

def int2bytes(integer: int) -> bytes:
	binary = bin(integer)[2:]
	return str2bytes("0"*(16 - len(binary)) + binary)

def hamming_dist(a, b) -> int:
	return int(np.sum((a + b) % 2))

def pad(data: bytes) -> bytes:
    L = AES.block_size * math.ceil(len(data) / AES.block_size)
    Nzeros = L - len(data)
    return data + bytes(Nzeros)

def encryption(msg: bytes, key: bytes) -> bytes:
    cipher = AES.new(key, AES.MODE_ECB)
    encrypted = cipher.encrypt(pad(msg))
    return b64encode(encrypted)

def decryption(encrypted_msg: bytes, key: bytes) -> str:
    cipher = AES.new(key, AES.MODE_ECB)
    message = cipher.decrypt(b64decode(encrypted_msg)).rstrip(b'\x00')
    return message.decode()
 
class SamplesReturnData:

    def __init__(self, samples : List[np.ndarray[np.uint8]], size : int) -> None:
        self._samples = samples       
        sample_sum = np.zeros(size, dtype=int)
        for sample in samples:
            sample_sum += sample
        self._reference: np.ndarray[np.uint8] = np.uint8(np.round(sample_sum/len(samples)))
        self._uniformity: float = self._reference.sum() / size
        
    @property
    def samples(self) -> np.ndarray[np.uint8]:
        return self._samples
    
    @property
    def reference(self) -> np.ndarray[np.uint8]:
        return self._reference
    
    @property
    def uniformity(self) -> float:
        return self._uniformity


class PUF:
    
    raw_size = 1023
    ecc_size = 171
    syndrome_size = 84
    sha256_size = 256
    default_ref_limit_counter = 200
    
    def __init__(self, port: str, baudrate: int = 230400, initial_ref_limit: int = 200, uart_port_delay: float = 0.1):
        self.port = port
        self.baudrate = baudrate
        self.uart_port_delay = uart_port_delay
        if initial_ref_limit != self.default_ref_limit_counter:
            self.set_ref_limit(initial_ref_limit)
        else:
            self._ref_limit = 200
        self._sha256_key = None
        self._syndrome = None
        logging.debug("PUF device initialized")
        logging.debug(f"| Port: {port}\n| Baudrate: {baudrate}\n| Ref counter limit: {initial_ref_limit}\n| Uart port delay: {uart_port_delay}")
        
    @property
    def ref_limit(self) -> int:
        return self._ref_limit
        
    @property
    def syndrome(self) -> bytes:
        return self._syndrome
        
    def set_syndrome(self, syndrome: str) -> None:
        if not isinstance(syndrome,str):
            raise TypeError("Syndrome argument should be an str.")
        elif not len(syndrome) == self.syndrome_size:
            raise ValueError(f"Syndrome size should be {self.syndrome_size}")
        self._syndrome = str2bytes(syndrome)
        logging.debug(f"Syndrome set to {syndrome}")
        
    def set_ref_limit(self, limit: int) -> None:
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
        
    def read_raw(self, response_size: int = None) -> np.ndarray[np.uint8]:
        if response_size is None:
            response_size = self.raw_size
        elif response_size > self.raw_size or response_size >= 0:
            raise ValueError(f"response_size should be lower or equal than {self.raw_size}.")
            
        response_Nbytes = math.ceil(response_size / 8)
            
        with serial.Serial(self.port, self.baudrate) as ser:
            time.sleep(self.uart_port_delay)
            ser.write(b'p')
            response = bytes2bits(ser.read(response_Nbytes))[:response_size]
            
        return response
            
    def read_raw_samples(self, response_size: int = None, sample_size: int = 1) -> SamplesReturnData:
        samples: List[np.ndarray[np.uint8]] = []
        
        if response_size is None:
            response_size = self.raw_size
        elif response_size > self.raw_size or response_size >= 0:
            raise ValueError(f"response_size should be lower or equal than {self.raw_size}.")
            
        response_Nbytes = math.ceil(response_size / 8)
            
        with serial.Serial(self.port, self.baudrate) as ser:
            time.sleep(self.uart_port_delay)
            for _ in tqdm(range(sample_size), desc=f"[READ RAW](ref limit={self.ref_limit})", leave = False, ncols=100):
                ser.write(b'p')
                samples.append(bytes2bits(ser.read(response_Nbytes))[:response_size])

        return SamplesReturnData(samples, response_size)
    
    def read_ecc(self) ->  np.ndarray[np.uint8]:
        if self.syndrome == None:
            raise SyndromeNotSetException("Syndrome need to be set before using the method 'read_ecc'.")
        response_Nbytes = math.ceil(self.ecc_size / 8)
        with serial.Serial(self.port, self.baudrate) as ser:
            time.sleep(self.uart_port_delay)
            ser.write(b's')
            ser.write(self.syndrome)
            response = bytes2bits(ser.read(response_Nbytes))[:self.ecc_size]
        return response
                
    def read_ecc_samples(self, sample_size: int = 1) -> SamplesReturnData:
        if self.syndrome == None:
            raise SyndromeNotSetException("Syndrome need to be set before using the method 'read_ecc'.")
        samples = []
        response_Nbytes = math.ceil(self.ecc_size / 8)
        with serial.Serial(self.port, self.baudrate) as ser:
            time.sleep(self.uart_port_delay)
            for _ in tqdm(range(sample_size), desc=f"[READ ECC](ref limit={self.ref_limit})", leave = False, ncols=100):
                ser.write(b's')
                ser.write(self.syndrome)
                samples.append(bytes2bits(ser.read(response_Nbytes))[:self.ecc_size])
        returnData = SamplesReturnData(samples, self.ecc_size)
        return returnData
    
    def read_sha256(self) ->  np.ndarray[np.uint8]:
        if self.syndrome == None:
            raise SyndromeNotSetException("Syndrome need to be set before using the method 'read_sha256'.")
        response_Nbytes = math.ceil(self.sha256_size / 8)
        with serial.Serial(self.port, self.baudrate) as ser:
            time.sleep(self.uart_port_delay)
            ser.write(b'k')
            ser.write(self.syndrome)
            response = bytes2bits(ser.read(response_Nbytes))[:self.sha256_size]
        return response
       
    def read_sha256_samples(self, sample_size: int = 1) -> SamplesReturnData:
        logging.debug(f"Starting sha read...")
        if self.syndrome == None:
            raise SyndromeNotSetException("Syndrome need to be set before using the method 'read_sha256'.")
        samples = []
        response_Nbytes = math.ceil(self.sha256_size / 8)
        with serial.Serial(self.port, self.baudrate) as ser:
            time.sleep(self.uart_port_delay)
            for _ in tqdm(range(sample_size), desc=f"[READ SHA256](ref limit={self.ref_limit})", leave = False, ncols=100):
                ser.write(b'k')
                ser.write(self.syndrome)
                samples.append(bytes2bits(ser.read(response_Nbytes))[:self.sha256_size])
        logging.debug(f"Sha256 read completed")
        return SamplesReturnData(samples, self.sha256_size)
    
if __name__ == "__main__":
    puf = PUF('COM6')
    print("Setting ref limit to 300.")
    puf.set_ref_limit(200)
    print("Reading raw puf...")
    returnDataRaw = puf.read_raw_samples(sample_size=100)
    print(f"RAW PUF 0 :\n{''.join([str(i) for i in returnDataRaw.samples[0]])}")
    print(f"REFERENCE :\n{''.join([str(i) for i in returnDataRaw.reference])}")
    print(f"UNIFORMITY : {returnDataRaw.uniformity}")
    puf.set_syndrome(str(input("Syndrome ? ")))
    returnDataEcc = puf.read_raw_samples(sample_size=100)
    print(f"RAW PUF 0 :\n{''.join([str(i) for i in returnDataEcc.samples[0]])}")
    print(f"REFERENCE :\n{''.join([str(i) for i in returnDataEcc.reference])}")
    print(f"UNIFORMITY : {returnDataRaw.uniformity}")
    sha = puf.read_sha256()
    print(f"SHA PUF 0 :\n{bits2str(sha)}")