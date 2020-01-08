#! /usr/bin/env python3

import subprocess

def getRemainingValidity():
    command="voms-proxy-info --timeleft"

    try:
        output = subprocess.check_output(command.split())
    except:
        return -1

    return (int)(output)

def shouldRenew():
    threshold=(int)(0.10 * 12 * 60 * 60)

    if getRemainingValidity() > threshold and getRemainingValidity() > 0:
        return False # In that case do not renew
    else:
        return True # In that case should renew ASAP

if __name__ == "__main__":
    print(shouldRenew())