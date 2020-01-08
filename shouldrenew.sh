#! /bin/bash

RETURN_CODE=`./python/shouldrenew.py`

echo $RETURN_CODE

if [[ $RETURN_CODE == *"True"* ]]; then
    true
else
    false
fi