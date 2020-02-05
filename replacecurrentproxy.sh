#! /bin/bash

VOMS_CERT_PATH="./vomsproxy.pem"

if [[ -f "$VOMS_CERT_PATH" ]]; then
    echo "Current proxy is at: $X509_USER_PROXY"

    echo "================= previous proxy info ================="
    voms-proxy-info --file "$X509_USER_PROXY"
    echo "======================================================="

    mv -f "$VOMS_CERT_PATH" "$X509_USER_PROXY"

    echo "==================== new proxy info ==================="
    voms-proxy-info --file "$X509_USER_PROXY"
    echo "======================================================="

    echo "Replaced with proxy at same path"
else
    echo "VOMS certificate not found at: $VOMS_CERT_PATH"
fi