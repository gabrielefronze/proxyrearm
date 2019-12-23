#! /bin/bash

PLAIN_CERT_PATH="./plainproxy.pem"
VALIDITY="168:00"

if [[ -f "$PLAIN_CERT_PATH" ]]; then
    echo "Output certificate path not empty: $PLAIN_CERT_PATH"
    read -p "Press enter to continue, ctrl+C to abort."
fi
grid-proxy-init -valid $VALIDITY -out $PLAIN_CERT_PATH