#!/usr/bin/python3
#   Test for the RAW and ECC reponse of the PUF, for a given acquisition time (limit)
#   This expect the normal implementation.
import csv
from puf_pkg import *

#Parameters
implementation = "tero_4"
n_sample = 10000
limit = 50
device = str(input("Device index? "))
print(f'Starting raw & ecc response with signal acquisition time experiment')
print(f'| {n_sample=}')
print(f'| {limit=}')
print(f'| {implementation=}')
print(f'| {device=}')

#PUF initialisation (Serial communication & acquisition time)
puf = PUF(initial_ref_limit=limit)

input("Press enter to start...\n")

#RAW response test
returnDataRaw = puf.read_raw_samples(sample_size=n_sample)
print(f"| Reference: {bits2str(returnDataRaw.reference)}")

#Save the data into .csv
print("| Saving RAW data...")
with open(f"{implementation}_raw_{limit}_device_{device}.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerows(returnDataRaw.samples)

#ECC response test
#   Require the syndrome as input (use the matlab bch script)
puf.set_syndrome(str(input("| Syndrome?")))
returnDataEcc = puf.read_ecc_samples(sample_size=n_sample)

#Save the data into .csv
print("| Saving ECC data...")
with open(f"{implementation}_ecc_{limit}_device_{device}.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerows(returnDataEcc.samples)

print("| Done")
