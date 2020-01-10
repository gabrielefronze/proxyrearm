#!/bin/bash

PLAIN_CERT_PATH="./plainproxy.pem"

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

if [[ ! -f "$PLAIN_CERT_PATH" ]]; then
    echo "Plain grid proxy not found. Generating one."
    bash $DIR/generateplainproxy.sh
fi

bash $DIR/getvomsproxy.sh
source $DIR/replacecurrentproxy.sh