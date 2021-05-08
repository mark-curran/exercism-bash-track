#!/usr/bin/env bash

# Exit with error code 1 if the input is empty
if ! (( $# == 2)); then
    echo "Usage: hamming.sh <string1> <string2>"
    exit 1
fi
# Return hamming distance 0 for identical empty inputs
if ((${#1} == 0 )) && ((${#2} == 0)); then
    echo 0
    exit 0
fi
# Test no input right
if ((${#1} == 0)); then
    echo "left and right strands must be of equal length"
    exit 1
fi
# Test no input left
if ((${#2} == 0)); then
    echo "left and right strands must be of equal length"
    exit 1
fi
# Test inputs equal length
if ! (( ${#1} == ${#2} )); then
    echo "left and right strands must be of equal length"
    exit 1
fi

hammingdist(){
    local x=0
    local string1=$1
    local string2=$2
    for ((i=0; i<${#string1}; i++)) do
        local char1=${string1:i:1}
        local char2=${string2:i:1}
        if ! [[ "$char1" == "$char2" ]]; then
            ((x++))
        fi
    done
    echo $x
    exit 0
}

hammingdist $1 $2
