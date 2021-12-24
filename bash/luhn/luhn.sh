#!/usr/bin/env bash

# Declare three arrays for odd, even and doubled characters
odds=()
evens=()
doubles=()

check_number() {
    # Iterate over characters in first argument
    for ((i=0; i<${#1}; i++)); do
        number=${1:i:1}
        polarity=$(( i % 2 ))
        # echo "The iterator i is $i"
        # echo "Number is $number"
        # echo "Polarity is $polarity"
        if [[ $polarity = 0 ]]; then
            evens+=("$number")
        else
            odds+=("$number")
        fi
    done

    for value in "${evens[@]}"
    do
        doubled_value=$(( value * 2 ))
        doubled_minus_nine=$(( doubled_value - 9 ))
        # echo "The value is $value"
        # echo "The doubled_value is $doubled_value"
        # echo "The doubled_minus_nine is $doubled_minus_nine"
        if [[ $(( doubled_minus_nine )) > 0 ]]; then
            doubles+=("$doubled_minus_nine")
        else
            doubles+=("$doubled_value")
        fi
    done

    # Declare the sum, which starts at zero.
    sum=0
    # echo "Sum over odds."
    for value in "${odds[@]}"
    do
        # echo "Value is $value"
        sum=$((sum + value))
    done
    # echo "sum over doubles."
    for value in "${doubles[@]}"
    do
        # echo "Value is $value"
        sum=$((sum + value))
    done

    # echo "The sum is $sum."

    if [[ ($((sum % 10)) != 0) ]]; then
        echo "false"
    else
        echo "true"
    fi
}

text_remove_characters="$( echo "$1" | tr -dc '0123456789 ')"
text_numbers_only="$( echo "$1" | tr -dc '0123456789')"
num_input_chars=${#text_numbers_only}
if [[ ("$text_remove_characters" != "$1") || ($((num_input_chars)) == 1) ]]; then
    echo "false"
else
    check_number "$text_numbers_only"
fi