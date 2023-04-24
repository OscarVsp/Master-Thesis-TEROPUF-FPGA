#!/usr/bin/python3
from puf_package import *


puf = PUF('/dev/ttyACM0')
sample = puf.read_raw().reference
size = len(sample)
print(f"{sample=}")

sample_bytes = bits2bytes(sample)
print(f"{sample_bytes=}")
sample_bits = bytes2bits(sample_bytes, size)
print(f"{sample_bits=} | {sample_bits == sample}")

sample_str = bits2str(sample)
print(f"{sample_str=}")
sample_bits = str2bits(sample_str)
print(f"{sample_bits=} | {sample == sample_bits}")

sample_str = bytes2str(sample_bytes, size = size)
print(f"{sample_str=}")
sample_bytes = str2bytes(sample_str)
print(f"{sample_bytes=} | {sample_bytes == bits2bytes(sample)}")