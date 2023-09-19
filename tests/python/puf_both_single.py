#!/usr/bin/python3
#   Test for the RAW and ECC reponse of the PUF, for a given acquisition time (limit)
#   This expect the normal implementation.
import csv
from puf_pkg import *

#Parameters
path = "matlab\\inter_device_raw_and_ecc"
model = "basys"
implementation = "tero_4"
n_sample = 10000
limit = 50
device = str(input("Device index? "))
port_com = str(int(input("Port COM number? ")))
print(f'Starting raw & ecc puf reading')
print(f'| {n_sample=}')
print(f'| {limit=}')
print(f'| {path=}')
print(f'| {model=}')
print(f'| {implementation=}')
print(f'| {device=}')
print(f'| Port=COM{port_com}')
input("| Press enter to start")

#PUF initialisation (Serial communication & acquisition time)
puf = PUF(f'COM{port_com}', initial_ref_limit=limit)

#RAW response test
returnDataRaw = puf.read_raw_samples(sample_size=n_sample)
print(f"| Reference: {bits2str(returnDataRaw.reference)}")
print("| Saving RAW data...")
with open(f"{path}\{model}_{implementation}_raw_{limit}_device_{device}.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerows(returnDataRaw.samples)

#ECC response test
#   Require the syndrome as input (use the matlab bch script)
puf.set_syndrome(str(input("| Syndrome?")))
returnDataEcc = puf.read_ecc_samples(sample_size=n_sample)
print("| Saving ECC data...")
with open(f"{path}\{model}_{implementation}_ecc_{limit}_device_{device}.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerows(returnDataEcc.samples)

print("| Done")
