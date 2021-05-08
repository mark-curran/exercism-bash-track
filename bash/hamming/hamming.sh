#!/usr/bin/env bash

checkvalidchar(){
    local validchars=(G A T C)
    local invalid=0
    for char in ${validchars[*]}; do
        if [[ $char = $1 ]]; then
            invalid=1
        fi
    done
    if (( $invalid == 0 )); then
        echo "Invalid character in string."
        exit 1
    fi
}

main() {
    string1=$1
    string2=$2
    # Exit with error code 1 if the input is empty
    if (( $# == 0)); then
        echo "Usage: hamming.sh <string1> <string2>"
        exit 1
    fi
    # Return hamming distance 0 for identical empty inputs
    if ((${#string1} == 0 )) && ((${#string2} == 0)); then
        echo 0
        exit 0
    fi
    # Test no input
    if ((${#string1} == 0)); then
        echo "Usage: hamming.sh <string1> <string2>"
        exit 1
    fi
    # Test inputs equal length
    if ! (( ${#string1} == ${#string2} )); then
        echo "left and right strands must be of equal length"
        exit 1
    fi
    local x=0
    for ((i=0; i<${#string1}; i++)) do
        local char1=${string1:i:1}
        local char2=${string2:i:1}
        checkvalidchar $char1
        checkvalidchar $char2
        if ! [[ $char1 == $char2 ]]; then
            ((x++))
        fi
    done
    echo $x
    exit 0
}

main $1 $2