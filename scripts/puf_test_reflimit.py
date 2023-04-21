#!/usr/bin/python3

from tqdm import tqdm
import csv


from puf_package import PUF


puf = PUF('COM6', 230400, response_raw_size=1023, response_ecc_size=171)

n_sample = 100
ref_limits = [5, 10, 25, 50, 75, 100, 125, 150, 175, 200, 225, 250, 300, 350, 400, 450, 500, 600, 700, 800, 900, 1000, 1250, 1500, 1750, 2000, 2500, 3000, 3500, 4000, 4500, 5000]
print("Starting puf reading")
for ref_limit in tqdm(ref_limits, desc=f"[Ref limit](Sample size={n_sample})", position=0, ncols=100):
	puf.set_ref_limit(ref_limit)
	samples = puf.read_raw(sample_size=n_sample)

	with open(f"ro_limit_{ref_limit}.csv", "w", newline="") as f:
		writer = csv.writer(f)
		writer.writerows(samples)
  
