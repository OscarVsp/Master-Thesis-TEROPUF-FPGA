#!/usr/bin/python3

import numpy as np  #> pip install numpy
import serial  #> pip install pyserial

from base64 import b64decode
import math
from tqdm import tqdm
import csv

PORT = 'COM6'
K = 171
Kp = 16*16

response_Nbytes = math.ceil(Kp / 8)


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

n_sample = 100
ref_limits = [5, 10, 25, 50, 75, 100, 125, 150, 175, 200, 225, 250, 300, 350, 400, 450, 500, 600, 700, 800, 900, 1000, 1250, 1500, 1750, 2000, 2500, 3000, 3500, 4000, 4500, 5000]
print("Starting puf reading")
print("-"*40)
print(f"| PUF bit size: {Kp} ({response_Nbytes} bytes)")
print(f"| Sample size: {n_sample}")
print("-"*40)
for ref_limit in tqdm(ref_limits, desc="Total", position=0, ncols=100):
	with serial.Serial(PORT, 230400) as ser:
		ser.write(b'c')
		ser.write(int2bytes(ref_limit))
	samples = []
	with serial.Serial(PORT, 230400) as ser:
		for _ in tqdm(range(n_sample), desc=f"ref limit={ref_limit}", position=1, leave=False, ncols=100):
			ser.write(b'p')
			response = data2bits(ser.read(response_Nbytes))[:Kp]
			sample = []
			for j in range(16):
				sample.append(str(int(bits2str(response[j*16:j*16+15]),2)))
			samples.append(sample)
	with open(f"tero_count_limit_{ref_limit}.csv", "w", newline="") as f:
		writer = csv.writer(f)
		writer.writerows(samples)