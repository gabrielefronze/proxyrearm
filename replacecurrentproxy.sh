#! /bin/bash

VOMS_CERT_PATH="./vomsproxy.pem"

if [[ -f "$VOMS_CERT_PATH" ]]; then
    echo "Current proxy is at: $X509_USER_PROXY"

    export OLD_X509_USER_PROXY=$X509_USER_PROXY

    export X509_USER_PROXY="$VOMS_CERT_PATH"

    echo "Replaced with proxy at: $X509_USER_PROXY"
    echo "Previous proxy still available at (OLD_X509_USER_PROXY): $OLD_X509_USER_PROXY"
else
    echo "VOMS certificate not found at: $VOMS_CERT_PATH"
fi