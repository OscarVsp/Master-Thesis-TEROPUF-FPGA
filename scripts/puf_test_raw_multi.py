#!/usr/bin/python3

from tqdm import tqdm
import csv

from puf_pkg import *

#path = "matlab\\intra_device_raw_perf_vs_aquisition_time"
path = "matlab\\nb_oscillations_equality_vs_aquisition_time"
prefix = "ro_raw_equality"
n_sample = 100
n_repeat = 20

print(f'Statring {prefix} raw puf reading')
print(f'| {n_sample=}')
print(f'| {n_repeat=}')
print(f'| {path=}')
print(f'| {prefix=}')

puf = PUF('COM6')

limits = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 22, 24, 26, 28, 30, 35, 45, 60, 75, 100, 125, 150, 175, 200]

for limit in tqdm(limits*n_repeat, desc=f"| [GLOBAL]", ncols=100):
    puf.set_ref_limit(limit)
    returnDataRaw = puf.read_raw_samples(sample_size=n_sample)
    with open(f"{path}\{prefix}_{limit}.csv", "a", newline="") as f:
        writer = csv.writer(f)
        writer.writerows(returnDataRaw.samples)
print("| Done")

