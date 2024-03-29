#!/usr/bin/python3
#   Test for the RAW reponse of the PUF, for different acquisition time (limits)
#   This expect the normal implementation.
#
#   This can also be used to measure the number of equalities during the comparaison by using an implementation where the comparator return '1' on an equality and '0' either.
from tqdm import tqdm
import csv
from puf_pkg import *

#Parameters
n_sample = 1000
n_repeat = 10
limits = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 18, 20, 24, 28, 35, 45, 60, 75, 100, 125, 150, 175, 200]
implementation = str(input("implementation? "))
print(f'Starting raw response with multiple acquisition time experiment')
print(f'| {n_sample=}')
print(f'| {n_repeat=}')
print(f'| {implementation=}')

#PUF initialisation (Serial communication)
puf = PUF()
input("Press enter to start...\n")

#RAW reponse for each limits
for limit in tqdm(limits*n_repeat, desc=f"[GLOBAL]", ncols=100):
        puf.set_ref_limit(limit)
        returnDataRaw = puf.read_raw_samples(sample_size=n_sample)
        
        #Save the data into .csv
        with open(f"{implementation}_raw_{limit}.csv", "a", newline="") as f:
            writer = csv.writer(f)
            writer.writerows(returnDataRaw.samples)
            
print("| Done")

