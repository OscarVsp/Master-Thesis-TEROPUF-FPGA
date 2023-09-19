#   Package to implement the UART communication between a host and a PUF
import sys
import time
from typing import List
import numpy as np 
import serial
import math
from tqdm import tqdm
import logging

class SyndromeNotSetException(Exception):
    """Raise when trying to read to ECC response before setting the syndrome
    """
    pass

def bytes2bits(data: bytes, size: int = None) -> np.ndarray[np.uint8]:
    """Convert `bytes` into a binary sequence

    Parameters
    ----------
    data : `bytes`
        The bytes to convert
    size : `int`, optional
        The size (in bit) of the data to return. By default, return everything

    Returns
    -------
    `np.ndarray[np.uint8]`
    """
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
    """Convert a binary sequence into `bytes`

    Parameters
    ----------
    data : `numpy.ndarray[numpy.uint8]`
        The bits to convert

    Returns
    -------
    `bytes`
    """
    return str2bytes(bits2str(data))

def bits2str(bits: np.ndarray[np.uint8]) -> str:
    """Return a string representation of the binary sequence
    """
    return ''.join(map(str, reversed(bits)))

def str2bits(bitstring: str) -> np.ndarray[np.uint8]:
    """Create a binary sequence from a string representation
    """
    return bytes2bits(str2bytes(bitstring), size=len(bitstring))

def str2bytes(bitstring: str) -> bytes:
    """Create a bytes value from the string representation of its binary sequence"""
    Nbytes = math.ceil(len(bitstring) / 8)
    return int(bitstring, 2).to_bytes(Nbytes, 'little')

def bytes2str(data: bytes, size: int = None) -> str:
    """Return a string representation of the binary sequence of a bytes"""
    return bits2str(bytes2bits(data, size=size))

def int2bytes(integer: int, size: int = 2) -> bytes:
    """Convert a `int` value to its bytes value"""
    binary = bin(integer)[2:]
    return str2bytes("0"*(8*size - len(binary)) + binary)

def hamming_dist(a, b) -> int:
	return int(np.sum((a + b) % 2))
 
class SamplesReturnData:
    """Object representing the data from a test using multiple sample.
    """

    def __init__(self, samples : List[np.ndarray[np.uint8]], size : int) -> None:
        self._samples = samples       
        sample_sum = np.zeros(size, dtype=int)
        for sample in samples:
            sample_sum += sample
        self._reference: np.ndarray[np.uint8] = np.uint8(np.round(sample_sum/len(samples)))
        self._uniformity: float = self._reference.sum() / size
        
    @property
    def samples(self) -> List[np.ndarray[np.uint8]]:
        """List of response sample (binary sequence)"""
        return self._samples
    
    @property
    def reference(self) -> np.ndarray[np.uint8]:
        """The reference response, derived from the sample."""
        return self._reference
    
    @property
    def uniformity(self) -> float:
        """The uniformity of the response, derived from the sample."""
        return self._uniformity


class PUF:
    
    raw_size = 1023
    ecc_size = 171
    syndrome_size = 84
    sha256_size = 256                   
    default_ref_limit_counter = 200
    default_baudrate = 230400
    
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
        """Set the syndrome to be used for future ECC response.
        
        This does not send the syndrome to the PUF, is simply store it locally for future use.
        
        This should be called at least once before using the `read_ecc()` and `read_ecc_sample()` methods.
        
        To compute the syndrome from the RAW response, use the `bch` matlab script.

        Parameters
        ----------
        syndrome : `str`
            The string representation of the syndrome bits.
        """
        if not isinstance(syndrome,str):
            raise TypeError("Syndrome argument should be an str.")
        elif not len(syndrome) == self.syndrome_size:
            raise ValueError(f"Syndrome size should be {self.syndrome_size}")
        self._syndrome = str2bytes(syndrome)
        logging.debug(f"Syndrome set to {syndrome}")
        
    def set_ref_limit(self, limit: int) -> None:
        """Set the acquisition time (#clock cycle) of the PUF.
        
        The PUF main clock speed is 200MHz.

        Parameters
        ----------
        limit : int
            Between 1 and 2^(16) = 65536
        """
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
        
    def read_raw(self) -> np.ndarray[np.uint8]:
        """Read a RAW reponse from the PUF

        Returns
        -------
        `np.ndarray[np.uint8]`
        """           
        response_Nbytes = math.ceil(self.raw_size / 8)
            
        with serial.Serial(self.port, self.baudrate) as ser:
            time.sleep(self.uart_port_delay)
            ser.write(b'p')
            response = bytes2bits(ser.read(response_Nbytes))[:self.raw_size]
            
        return response
            
    def read_raw_samples(self, sample_size: int = 1) -> SamplesReturnData:
        """Read multiple sample of the RAW response from the PUF

        Parameters
        ----------
        sample_size : `int`, optional
            The number of sample to read, by default 1

        Returns
        -------
        `SamplesReturnData`
        """
        samples: List[np.ndarray[np.uint8]] = []
        response_Nbytes = math.ceil(self.raw_size / 8)
            
        with serial.Serial(self.port, self.baudrate) as ser:
            time.sleep(self.uart_port_delay)
            for _ in tqdm(range(sample_size), desc=f"[READ RAW](ref limit={self.ref_limit})", leave = False, ncols=100):
                ser.write(b'p')
                samples.append(bytes2bits(ser.read(response_Nbytes))[:self.raw_size])

        return SamplesReturnData(samples, self.raw_size)
    
    def read_ecc(self) ->  np.ndarray[np.uint8]:
        """Read a ECC reponse from the PUF
        
        This required the syndrome to be previously set, using the `set_syndrome()` method.

        Returns
        -------
        `np.ndarray[np.uint8]`

        Raises
        ------
        `SyndromeNotSetException`
        """  
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
        """Read multiple sample of the ECC response from the PUF
        
        This required the syndrome to be previously set, using the `set_syndrome()` method.

        Parameters
        ----------
        sample_size : `int`, optional
            The number of sample to read, by default 1

        Returns
        -------
        `SamplesReturnData`

        Raises
        ------
        `SyndromeNotSetException`
        """
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
        """Read the SHA256 key from the PUF
        
        This required the syndrome to be previously set, using the `set_syndrome()` method.

        Returns
        -------
        `np.ndarray[np.uint8]`

        Raises
        ------
        `SyndromeNotSetException`
        """
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
        """Read multiple sample of the SHA256 key from the PUF
        
        This required the syndrome to be previously set, using the `set_syndrome()` method.

        Parameters
        ----------
        sample_size : `int`, optional
            The number of sample to read, by default 1

        Returns
        -------
        `SamplesReturnData`

        Raises
        ------
        `SyndromeNotSetException`
        """
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
    
    port = sys.argv[1]
    try:
        baudrate = int(sys.argv[2])
    except IndexError:
        baudrate = PUF.default_baudrate
        
    puf = PUF(port, baudrate=baudrate)
    print("Setting ref limit to 200.")
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