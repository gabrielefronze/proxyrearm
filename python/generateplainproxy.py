#! /usr/bin/env python3

import argparse
import os.path
import subprocess

plainCertPath="./plainproxy.pem"
validityHours=7*24

def generatePlainProxy(_plainCertPath, _validityHours):
    print("Generating new plain GRID proxy at {} with duration {}".format(_plainCertPath, _validityHours))

    _plainCertPath = os.path.abspath(_plainCertPath)

    if os.path.isfile(_plainCertPath):
        print("Output certificate path not empty: {}".format(_plainCertPath))

        try:
            input("Press any key to continue, ctrl+C to abort.")
        except SyntaxError:
            pass
    
    command = "grid-proxy-init -valid {}:00 -out {}".format(_validityHours, _plainCertPath)
    output = subprocess.call(command.split())

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='This utility creates a plain x509 proxy from the userkey.pem and usercert.pem files located in ~/.globus.')
    parser.add_argument("--output", "-o", type=str, help="Optional plain proxy destination path, defaults to {}".format(plainCertPath))
    parser.add_argument("--valid", "-v", type=str, help="Optional resulting plain proxy duration, defaults to {}".format(validityHours))
    args = parser.parse_args()

    if args.output:
        plainCertPath = args.output

    if args.valid:
        validityHours = (int)(args.valid)

    generatePlainProxy(plainCertPath, validityHours)
    
