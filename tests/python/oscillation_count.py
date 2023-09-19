#!/usr/bin/python3
#	Test script to record the number of oscillation of each cells, for differents acquisition time (limits)
#
#	This expect a modified implementation that return the concatenate number of oscillations (2 bytes) of each 64 cells on a raw read (2*64=128 bytes per read).

from tqdm import tqdm
import serial
import csv
import time
from puf_pkg import int2bytes

#Parameters
n_tero_cell = 64		#Fixed by the implementation
n_sample = 1000
n_repeat = 10
limits = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 18, 20, 24, 28, 35, 45, 60, 75, 100, 125, 150, 175, 200]	#Number of clock cycle, 200MHz clock speed
path = "matlab\\nb_oscillations_vs_aquisition_time"
model = "basys"
prefix = str(input("prefix? "))
port_com = str(int(input("Port COM number? ")))
print(f"Starting count limit test")
print(f"| {n_sample=}")
print(f"| {n_repeat=}")
print(f"| {path=}")
print(f"| {prefix=}")
print(f"| {model=}")
print(f'| Port=COM{port_com}')
input("| Press enter to start...")

#Number of oscillation for each acquisition time
with serial.Serial(f'COM{port_com}', 230400) as ser:
	time.sleep(0.1)
	for limit in tqdm(limits*n_repeat, desc=f"| [GLOBAL]", ncols=100):
		ser.write(b'c')
		ser.write(int2bytes(limit))
		samples = []
		for _ in tqdm(range(n_sample), desc=f"| [CURRENT LIMIT]({limit})", leave = False, ncols=100):
			ser.write(b'p')
			sample = []
			for n in range(n_tero_cell):
				sample.append(int.from_bytes(ser.read(size=2), "little"))
			samples.append(sample)
		with open(f"{path}\{model}_{prefix}_count_limit_{limit}.csv", "a", newline="") as f:
			writer = csv.writer(f)
			writer.writerows(samples)

print(f"| Done")