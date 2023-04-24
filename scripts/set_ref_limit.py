#!/usr/bin/python3
from puf_package import *

puf = PUF('/dev/ttyACM0')

puf.set_syndrome("0"*84)
resp = puf.read_ecc()
ecc = resp.reference
sha_256_key = bits2sha256(ecc)
