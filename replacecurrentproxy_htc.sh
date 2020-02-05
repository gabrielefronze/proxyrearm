#! /bin/bash

VOMS_CERT_PATH="./vomsproxy.pem"

if [[ -f "$VOMS_CERT_PATH" ]]; then
    echo "Current proxy is at: $X509_USER_PROXY and /tmp/$X509_USER_PROXY"

    echo "================= previous proxy info ================="
    voms-proxy-info -p "$X509_USER_PROXY"
    echo "======================================================="

    mv -f "$VOMS_CERT_PATH" "$X509_USER_PROXY"
    # In HTC a copy of the submission proxy is created under /tmp and needs to be replaced as well
    cat "$X509_USER_PROXY" > /tmp/"$X509_USER_PROXY"

    echo "==================== new proxy info ==================="
    voms-proxy-info -p "$X509_USER_PROXY"
    echo "======================================================="

    echo "Replaced with proxy at same paths"
else
    echo "VOMS certificate not found at: $VOMS_CERT_PATH"
fi