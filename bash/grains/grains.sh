#!/usr/bin/env bash

# Return total if asked.
if [[ "$1" == "total" ]]; then
    echo "18446744073709551615"
# 2^64 overflows my terminal, so hard code this response value. 
elif [[ "$1" == "64" ]]; then
    echo "9223372036854775808"
# Return error if input is not an integer between 1 and 64 inclusive.
elif [[ ( "$( echo $1 | tr -dc '0123456768')" != "$1") || ($(($1)) < 1) || ($(($1)) > 64)]]; then
    echo "Error: invalid input"
    exit 1
else
    echo "$((2**($1-1)))"
fi
