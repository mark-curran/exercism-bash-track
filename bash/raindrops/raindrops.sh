#!/usr/bin/env bash



stuff() {
    if ! [[ $1 =~ ^-?[0-9]+$ ]]; then
        echo "Input is not a valid integer."
        exit 1    
    fi

    local output=""
    local altered=0
    if (( $1%3 == 0 )); then
        output="$output""Pling"
        altered=1
    fi
    if (( $1%5 == 0 )); then
        output="$output""Plang"
        altered=1
    fi
    if (( $1%7 == 0 )); then
        output="$output""Plong"
        altered=1
    fi
    if [[ $altered == 0 ]]; then
        echo "$1"
        exit 0
    fi
    
    echo $output
}

stuff $1