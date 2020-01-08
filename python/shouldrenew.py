#! /usr/bin/env python3

import subprocess

def shouldRenew():
    maxValidity=12*60*60
    threshold=10*60

    command="voms-proxy-info --timeleft"

    try:
        output = subprocess.check_output(command.split())
    except:
        return True

    if isinstance(output, str):
        print("is string")
        return True # In case no proxy is found

    remainingValidity = (int)(output)

    if remainingValidity > threshold:
        return False # In that case do not renew
    else:
        return True # In that case should renew ASAP

if __name__ == "__main__":
    print(shouldRenew())