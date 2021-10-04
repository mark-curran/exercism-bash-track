#!/usr/bin/env bash

# Declare associate array to store letter values
declare -A values

# Add letters with value equal to 1
letters=("A" "E" "I" "O" "U" "L" "N" "R" "S" "T")
for letter in ${letters[@]}; do
    values[$letter]=1
done

# Add letters with value equal to 2
letters=("D" "G")
for letter in ${letters[@]}; do
    values[$letter]=2
done

# Add letters with value equal to 2
letters=("D" "G")
for letter in ${letters[@]}; do
    values[$letter]=2
done

# Add letters with value equal to 3
letters=("B" "C" "M" "P")
for letter in ${letters[@]}; do
    values[$letter]=3
done

# Add letters with value equal to 4
letters=("F" "H" "V" "W" "Y")
for letter in ${letters[@]}; do
    values[$letter]=4
done

# Add letters with value equal to 5
letters=("K")
for letter in ${letters[@]}; do
    values[$letter]=5
done

# Add letters with value equal to 8
letters=("J" "X")
for letter in ${letters[@]}; do
    values[$letter]=8
done

# Add letters with value equal to 10
letters=("Q" "Z")
for letter in ${letters[@]}; do
    values[$letter]=10
done

main () {
    local uppercase_input="$( echo $1 | tr [a-z] [A-Z])"
    local score=0

    for ((i=0; i<${#uppercase_input}; i++)); do
        letter=${uppercase_input:i:1}
        value=${values[$letter]}
        ((score+=$value))
    done
    echo $score
}

main "$@"