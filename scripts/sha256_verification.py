#!/usr/bin/python3


from base64 import b64decode
import hashlib
import math
from puf_pkg import PUF, str2bytes


# Provisioning
puf_response = "010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010"
simple_one = "1"
zeros = "0"*(448-len(puf_response)-1)
size = "10101011"
padded_size = "0"*(64-len(size)) + size
padded_block = puf_response + simple_one + zeros + padded_size
print(f"{puf_response=}")
print(f"{len(puf_response)=}")
bytes_puf = str2bytes(puf_response[::-1])
print(f"{bytes_puf=}")
key = hashlib.sha256(bytes_puf)
print('Hashed key:', key.hexdigest())
puf_key = "cf7200893050f4827e679ac9d90d82dbd661775ff6e13f057838286930b07bdb"
print(f"Produced one: {puf_key}")
print(key.hexdigest() == puf_key)
