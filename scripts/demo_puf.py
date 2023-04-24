#!/usr/bin/python3

import numpy as np  #> pip install numpy
import serial  #> pip install pyserial
#from cryptography.fernet import Cipher,algorithms, modes  #> pip install cryptography

from base64 import b64decode
import hashlib
import math
import subprocess
import sys

if sys.platform == "win32":
    MATLAB = 'matlab'
    PORT = 'COM6'
else:
	MATLAB = '/opt/MATLAB/R2020b/bin/matlab'
	PORT = '/dev/ttyUSB1'
N_PROVISIONS = 100
N = 255
K = 171
Kp = 1023

response_Nbytes_p = math.ceil(Kp / 8)
remainer = response_Nbytes_p*8 - Kp

response_Nbytes = math.ceil(K / 8)


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


# Provisioning

reference = np.zeros(Kp, dtype=int)
with serial.Serial(PORT, 230400) as ser:
	for _ in range(N_PROVISIONS):
		ser.write(b'p')
		response = data2bits(ser.read(response_Nbytes_p))
		reference += response[:Kp]
		print(bits2str(response))
reference = np.uint8(np.round(reference / N_PROVISIONS))
print('Reference response:')
print(bits2str(reference))
print('Uniformity:', reference.sum() / K)
print()

# Syndrome response


syndrome = str(input("syndrome ?\n"))
syndrome_bytes = str2bytes(syndrome)
print(syndrome_bytes)
while True:
	with serial.Serial(PORT, 230400) as ser:
		ser.write(b's')
		ser.write(syndrome_bytes)
		response = data2bits(ser.read(response_Nbytes))[:K]
		print(f'Response: {bits2str(response)}')
		print('Number of bit errors:', hamming_dist(reference, response))
		key = hashlib.sha256(str2bytes(bits2str(response)))
		print('Hashed key:', key.hexdigest())
		print()

encrypted = input('Input encrypted message: ')
cipher = algorithms.AES(key.digest())		#AES.MODE_ECB)
message = Cipher.decryptor(modes.ECB).decrypt(b64decode(encrypted)).rstrip(b'\x00')
print('Message:', message.decode())
