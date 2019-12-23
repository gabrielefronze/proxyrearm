#! /bin/bash

INPUT_PLAIN_CERT_PATH="./plainproxy.pem"
OUTPUT_VOMS_CERT_PATH="./vomsproxy.pem"
VOMS_STRING="virgo:/virgo/virgo"

voms-proxy-init -cert $INPUT_PLAIN_CERT_PATH -n -voms $VOMS_STRING --out $OUTPUT_VOMS_CERT_PATH