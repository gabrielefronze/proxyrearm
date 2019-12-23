#! /bin/bash

PLAIN_CERT_PATH="./plainproxy.pem"
VALIDITY="168:00"

echo "Generating new plain GRID proxy at $PLAIN_CERT_PATH with duration $VALIDITY"

if [[ -f "$PLAIN_CERT_PATH" ]]; then
    echo "Output certificate path not empty: $PLAIN_CERT_PATH"
    read -p "Press enter to continue, ctrl+C to abort."
fi
grid-proxy-init -valid $VALIDITY -out $PLAIN_CERT_PATH