#!/usr/bin/python3
import serial  #> pip install pyserial
import time

PORT = 'COM4'
Kp = 1023

response_Nbytes = 128



with serial.Serial(PORT, 230400) as ser:
    print("Opening port...")
    time.sleep(0.1)
    print("Sending char 'p'...")
    if ser.write(b'p') == 1:
        print("wait for response...")
        for i in range(response_Nbytes):
            print(f"{i} : {ser.read(1)}")	
    else:
        print("error serial")
