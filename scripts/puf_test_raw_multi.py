#!/usr/bin/python3

from tqdm import tqdm
import csv

from puf_pkg import *

#path = "matlab\\intra_device_raw_perf_vs_aquisition_time"
path = "matlab\\nb_oscillations_equality_vs_aquisition_time"
model = "basys"
n_sample = 1000
n_repeat = 10


implementation = str(input("implementation? "))
port_com_num = str(int(input("Port COM num? ")))

print(f'Starting raw puf reading')
print(f'| {n_sample=}')
print(f'| {n_repeat=}')
print(f'| {path=}')
print(f'| {model=}')
print(f'| {implementation=}')
print(f'| Port=COM{port_com_num}')

puf = PUF(f'COM{port_com_num}')

limits = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 18, 20, 24, 28, 35, 45, 60, 75, 100, 125, 150, 175, 200]

for limit in tqdm(limits*n_repeat, desc=f"| [GLOBAL]", ncols=100):
        puf.set_ref_limit(limit)
        returnDataRaw = puf.read_raw_samples(sample_size=n_sample)
        with open(f"{path}\{model}_{implementation}_raw_{limit}.csv", "a", newline="") as f:
            writer = csv.writer(f)
            writer.writerows(returnDataRaw.samples)
print("| Done")

