#! /usr/bin/env python3

import argparse
import os.path
import subprocess

inputPlainCertPath="./plainproxy.pem"
outputVOMSCertPath="./vomsproxy.pem"
VOMSID="virgo:/virgo/virgo"

def getVOMSProxy(_inputPlainCertPath, _outputVOMSCertPath, _VOMSID):
    print("Extending with {} attributes a plain GRID proxy at {} with duration of 12h.".format(_VOMSID, _inputPlainCertPath))
    print("Output VOMS-extended certificate at {}".format(_outputVOMSCertPath))

    _inputPlainCertPath = os.path.abspath(_inputPlainCertPath)
    _outputVOMSCertPath = os.path.abspath(_outputVOMSCertPath)

    if os.path.isfile(_inputPlainCertPath):
        if os.path.isfile(_outputVOMSCertPath):
            print("Output certificate path not empty: {}".format(_outputVOMSCertPath))

            try:
                input("Press any key to continue, ctrl+C to abort.")
            except SyntaxError:
                pass

        command = "voms-proxy-init -cert {} -n -voms {} --out {}".format(_inputPlainCertPath, _VOMSID, _outputVOMSCertPath)
        output = subprocess.call(command.split())
    else:
        print("Input certificate not found at: {}".format(_inputPlainCertPath))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='This utility creates a plain x509 proxy from the userkey.pem and usercert.pem files located in ~/.globus.')
    parser.add_argument("--voms", "-m", type=str, required=True, help="Required VOMS ID string")
    parser.add_argument("--input", "-i", type=str, help="Optional plain proxy input path, defaults to {}".format(inputPlainCertPath))
    parser.add_argument("--output", "-o", type=str, help="Optional VOMS proxy destination path, defaults to {}".format(outputVOMSCertPath))
    args = parser.parse_args()

    if args.input:
        inputPlainCertPath = args.input

    if args.output:
        outputVOMSCertPath = args.output

    getVOMSProxy(inputPlainCertPath, outputVOMSCertPath, args.voms)