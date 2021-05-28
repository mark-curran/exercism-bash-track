#!/usr/bin/env bash

# get length of input
length=${#1}
# set initial value of result to zero
result=0
# iteratre over characters of input
for ((i=0;i<${#1};++i)) do
    digit=${1:i:1}
    result=$((result + digit**length))
done

# confirm whether armstrong number or not
if (( $result == $1 )); then
    echo "true"
    exit 0
fi
echo "false"
exit 0