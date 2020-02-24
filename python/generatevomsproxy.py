#! /usr/bin/env python3

import argparse
import os.path
import subprocess

validityHours=24

def generateVomsProxy(_VOMS, _validityHours):
    command = "voms-proxy-init --valid {}:00 --voms {}".format(_validityHours, _VOMS)
    output = subprocess.call(command.split())

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='This utility creates a plain x509 proxy from the userkey.pem and usercert.pem files located in ~/.globus.')
    parser.add_argument("--voms", "-m", type=str, help="Provide VOMS ID to be attached to the proxy.")
    parser.add_argument("--valid", "-v", type=str, help="Optional resulting plain proxy duration, defaults to {}".format(validityHours))
    args = parser.parse_args()

    if args.voms:
        if args.valid:
            validityHours = (int)(args.valid)

        generateVomsProxy(args.voms, validityHours)
    else:
        print("ERROR: no VOMS ID specified. Aborting.")    
