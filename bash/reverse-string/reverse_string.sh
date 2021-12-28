#!/usr/bin/env bash

main() {
    local length_of_input=${#1}
    local output_string=''

    # Iterate over characters in first argument.
    for ((i=0; i<length_of_input; i++)); do
        letter=${1:((length_of_input-i-1)):1}
        output_string+="${letter}"
    done

    echo "$output_string"
}

main "$@"
