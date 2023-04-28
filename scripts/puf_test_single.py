#!/usr/bin/python3

import csv


from puf_pkg import *

path = "matlab\\intra_device_raw_and_ecc_perf"
prefix = "ro"#"tero_8" #"ro"
n_sample = 10000
limit = 200

print(f'Starting {prefix} raw & ecc puf reading')
print(f'| {n_sample=}')
print(f'| {limit=}')
print(f'| {path=}')
print(f'| {prefix=}')

puf = PUF('COM6', initial_ref_limit=limit)
returnDataRaw = puf.read_raw_samples(sample_size=n_sample)
with open(f"{path}\{prefix}_raw_{limit}.csv", "a", newline="") as f:
    writer = csv.writer(f)
    writer.writerows(returnDataRaw.samples)
print(f"Reference: {bits2str(returnDataRaw.reference)}")
puf.set_syndrome(str(input("Syndrome: ")))
returnDataEcc = puf.read_ecc_samples(sample_size=n_sample)
with open(f"{path}\{prefix}_ecc_{limit}.csv", "a", newline="") as f:
    writer = csv.writer(f)
    writer.writerows(returnDataEcc.samples)
print("| Done")
