#! /bin/bash

VOMS_CERT_PATH="./vomsproxy.pem"

echo "Current proxy is at: $X509_USER_PROXY"

export OLD_X509_USER_PROXY=$X509_USER_PROXY

export X509_USER_PROXY=$VOMS_CERT_PATH

echo "Replaced with proxy at: $X509_USER_PROXY"
echo "Previous proxy still available at (OLD_X509_USER_PROXY): $OLD_X509_USER_PROXY"