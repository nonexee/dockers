#!/bin/bash

target="$1"
word="$2"

# Add /FUZZ if it is missing in the target
if [[ $target != *"FUZZ"* ]]; then
    if [ $? -eq 1 ]; then
        target="${target}/"
    fi
    target="${target}/FUZZ"
    echo "Changed target URL to: $target"
fi

#set -x

# Scan
./ffuf -w $word \
    -u $target \
    -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0" \
    -ac \
    -r \
    -c \
    ${@:3}
