#!/usr/bin/env bash

# Convert input to lower case
input="${1,,}"

# Loop over a to z, change flag to 1 if a letter is missing
flag=0
for x in {a..z}
do
    if ! [[ $input = *$x* ]]; then
        flag=1
    fi
done

# If a letter was missing return 'false', else return 'true'
if [ "${missing}" -eq 1 ]; then
    echo "false"
else
    echo "true"
fi

