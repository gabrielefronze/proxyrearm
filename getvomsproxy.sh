#! /bin/bash

INPUT_PLAIN_CERT_PATH="./plainproxy.pem"
OUTPUT_VOMS_CERT_PATH="./vomsproxy.pem"
VOMS_STRING="virgo:/virgo/virgo"

if [[ -f "$INPUT_PLAIN_CERT_PATH" ]]; then
    if [[ -f "$OUTPUT_VOMS_CERT_PATH" ]]; then
        echo "Output certificate path not empty: $OUTPUT_VOMS_CERT_PATH"
        read -p "Press enter to continue, ctrl+C to abort."
    fi
    voms-proxy-init -cert $INPUT_PLAIN_CERT_PATH -n -voms $VOMS_STRING --out $OUTPUT_VOMS_CERT_PATH
else
    echo "Input certificate not found at: $INPUT_PLAIN_CERT_PATH"
fi