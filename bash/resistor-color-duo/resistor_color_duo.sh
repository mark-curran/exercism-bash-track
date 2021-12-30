#!/usr/bin/env bash

# A list of the colors, ordered by their resistance value
colors=('black' 'brown' 'red' 'orange' 'yellow' 'green' 'blue' 'violet' 'grey' 'white')

# Check the first two value of the input are in the list
for arg in "${@:1:2}"; do
    if [[ $( echo "${colors[@]}" | grep -w -q "$arg" && echo '' || echo ' ' ) ]]; then
        echo "$arg is an invalid color"
        exit 1 
    fi
done

# Create an array with the value of each color
declare -A color_values
for ((i=0; i<${#colors[@]}; i++)); do
    color_values["${colors[i]}"]=$i
done

# Return the values of the first and second output, drop any leading zeroes
echo "$( echo "${color_values["$1"]}" | tr -d '0' )""${color_values["$2"]}"
