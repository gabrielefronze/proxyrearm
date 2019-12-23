#! /bin/bash

PLAIN_CERT_PATH="./plainproxy.pem"
VALIDITY="168:00"

grid-proxy-init -valid $VALIDITY -out $PLAIN_CERT_PATH