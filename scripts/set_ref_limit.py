#!/usr/bin/python3


import serial  #> pip install pyserial
#from cryptography.fernet import Cipher,algorithms, modes  #> pip install cryptography

from base64 import b64decode
import math
import sys

if sys.platform == "win32":
    PORT = 'COM6'
else:
	PORT = '/dev/ttyUSB1'


def bits2str(bits):
	return ''.join(map(str, reversed(bits)))

def str2bytes(bitstring):
	Nbytes = math.ceil(len(bitstring) / 8)
	return int(bitstring, 2).to_bytes(Nbytes, 'little')

input_value = bin(int(input("refcounter_limit ?\n")))[2:]
print(f"input value: {input_value}")
refcounter_limit = str2bytes("0"*(16 - len(input_value)) + input_value)
print(f"Refcounter limit: {refcounter_limit}")
with serial.Serial(PORT, 230400) as ser:
	ser.write(b'c')
	ser.write(refcounter_limit)

