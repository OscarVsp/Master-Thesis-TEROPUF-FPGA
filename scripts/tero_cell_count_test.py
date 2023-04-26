#!/usr/bin/python3

from tqdm import tqdm
import serial
import csv
import time


from puf_pkg import int2bytes

n_bits = 1024
n_tero_cell = 64
n_sample = 1000
n_repeat = 4

path = "matlab\count_vs_time"
prefix = "tero_4_count_limit"

print(f"Starting count limit test")
print(f"| {n_sample=}")
print(f"| {n_repeat=}")
print(f"| {path=}")
print(f"| {prefix=}")


with serial.Serial('COM6', 230400) as ser:
	time.sleep(0.1)
	for limit in tqdm([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 14, 16, 18, 20, 25, 35, 45, 60, 75, 100, 125, 150, 175, 200, 225, 250, 275, 300, 325, 350, 375, 400, 425, 450, 475, 500]*n_repeat, desc=f"[GLOBAL]", leave = False, ncols=100):
		ser.write(b'c')
		ser.write(int2bytes(limit))
		samples = []
		for _ in tqdm(range(n_sample), desc=f"[CURRENT LIMIT]({limit})", leave = False, ncols=100):
			ser.write(b'p')
			sample = []
			for n in range(n_tero_cell):
				sample.append(int.from_bytes(ser.read(size=2), "little"))
			samples.append(sample)
		with open(f"{path}\{prefix}_{limit}.csv", "a", newline="") as f:
			writer = csv.writer(f)
			writer.writerows(samples)

print(f"| Done")