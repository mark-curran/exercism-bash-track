#!/usr/bin/env bash

binary_decode () {
    # """
    # Return the binary representation of the first arg, where the number of bytes
    # is determiend by the second argumetn.
    # """

    local num_bytes=$2
    local current_remainder=$1
    local current_power_of_two=0  # Initialize to random value.
    local binary_string=""

    for ((i=(($num_bytes-1)); i>=0; i--)); do
        current_power_of_two=$((2**i))

        if (( $current_remainder>=$current_power_of_two )); then
            binary_string="${binary_string}1"
            current_remainder=$((current_remainder - current_power_of_two))
        else
            binary_string="${binary_string}0"
            
        fi
    done
    echo "$binary_string"
}

main() {

    local actions=("jump" "close your eyes" "double blink" "wink")
    local output_list=()
    local output_string=""

    binary_string=$( binary_decode $1 5 )

    # Get the actions we need in the correct order
    for (( i=${#binary_string}-1; i>=1; i-- )); do
        digit=${binary_string:i:1}
        if (( $digit==1 )); then
            output_list+=("${actions[i-1]}")
        fi
    done

    # Concatenate strings in list, reverse the order if leading digit equals "1"
    if [[ ${binary_string:0:1} == "1" ]]; then
        for (( i=${#output_list[@]}-1; i>=0; i-- )); do
            output_string+="${output_list[i]},"
        done
    else
        for value in "${output_list[@]}"; do
            output_string+="$value,"
        done
    fi
    
    # Echo nothing for zero, otherwise, echo output without the trailing comma.
    if (( ${#output_string}==0 )); then
        echo ""
    else 
        echo "${output_string:0:${#output_string}-1}"
    fi
}

main "$@"