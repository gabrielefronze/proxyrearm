# ProxyRearm

## Rationale
This tool is intended to wrap the commands needed to generate a short lived VOMS-extended x509 proxy from a longer-lasting plain x509 GRID proxy.

## Requirements
The scripts wrap `grid-proxy-*` and `voms-proxy-*` commands, therefore these executables have to be available in the `PATH`.

## Usage - one shot
Simply run;
```
    bash proxyrearm-oneclick.sh
```
and input your credentials password if prompted.
Note that the password prompt will only be shown if there is no `plainproxy.pem` file alongside the script and the `~/.globus` directory is populated with valid credentials.
In case a valid `plainproxy.pem` is found, the password prompt should not happen and the execution is totally independent from the presence of the `~/.globus` directory.
This will generate a `plainproxy.pem` and a `vomsproxy.pem` alongside the script.

## Usage - step by step
1. Generate a plain GRID proxy:
    ```
    ./generateplainproxy.sh
    ```
    Input your credential password when prompted.
    Note that this is needed if and only if a valid `plainproxy.pem` is not present in the same directory of the scripts.

2. Generate a VOMS-extended proxy from the plain GRID proxy you have just generated:
    ```
    ./getvomsproxy.sh
    ```

3. **OPTIONAL:** make `X509_USER_PROXY` point to the new VOMS-extended proxy:
    ```
    source ./replacecurrentproxy
    ```
    The previous value of `X509_USER_PROXY` is now stored in the `OLD_X509_USER_PROXY` variable.