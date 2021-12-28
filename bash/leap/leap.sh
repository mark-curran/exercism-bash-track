#!/usr/bin/env bash

check_if_divisible() {
    if (( ($1 % $2) == 0)); then
        echo "1"
    else
        echo "0"
    fi
}

check_if_leapyear() {
    local div_by_four
    local div_by_hundred
    local div_by_four_hundred

    div_by_four="$(check_if_divisible "$1" "4")"
    div_by_hundred="$(check_if_divisible "$1" "100")"
    div_by_four_hundred="$(check_if_divisible "$1" "400")"

    # Not divisible by four, then not a leap year.
    if [[ "$div_by_four" -eq 0 ]]; then
        # echo "Not div by four, Not a leap year."
        echo "false"
    # Is divisible by four, but not divisible by one hundred, then is a leap year.
    elif [[ ("$div_by_four" -eq 1) && ("$div_by_hundred" -eq 0) ]]; then
        # echo "Div by four but not 100, is a leap year."
        echo "true"
    # Is divisible by four hundred, then is a leap year. 
    elif [[ "$div_by_four_hundred" -eq 1 ]]; then
        # echo "Div by 400, is a leap year."
        echo "true"
    else
        # echo "Not a leap year."
        echo "false"
    fi
}

# Test if input is anything other than the numbers 0 through 9
if [[ ( "$( echo "$1" | tr -dc '01234567689')" != "$1") ]]; then
    echo "Usage: leap.sh <year>"
    exit 1
# Test if too many arguments.
elif [[ $# -ne 1 ]]; then
    echo "Usage: leap.sh <year>"
    exit 1
else
    check_if_leapyear "$@"
fi