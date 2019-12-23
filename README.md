# ProxyRearm

## Rationale
This tool is intended to wrap the commands needed to generate a short lived VOMS-extended x509 proxy from a longer-lasting plain x509 GRID proxy.

## Requirements
The scripts wrap `grid-proxy-*` and `voms-proxy-*` commands, therefore these executables have to be available in the `PATH`.

## Usage
1. Generate a plain GRID proxy:
    ```
    ./generateplainproxy.sh
    ```

2. Generate a VOMS-extended proxy from the plain GRID proxy you have just generated:
    ```
    ./getvomsproxy.sh
    ```

3. **OPTIONAL:** make `X509_USER_PROXY` point to the new VOMS-extended proxy:
    ```
    source ./replacecurrentproxy
    ```
    The previous value of `X509_USER_PROXY` is now stored in the `OLD_X509_USER_PROXY` variable.