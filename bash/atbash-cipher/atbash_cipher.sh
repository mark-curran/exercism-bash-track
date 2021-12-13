#!/usr/bin/env bash
declare -A substitutes

# Define an associate array to do the substitution.
alphabet='abcdefghijklmnopqrstuvwxyz'
for ((i=0; i<${#alphabet}; i++)); do
    letter=${alphabet:i:1}
    value=${alphabet:25-i:1}
    substitutes[$letter]=$value
done

return_substitute_if_exists() {
    # Test returns empty if substitute exists, otherwise empty string.
    local substitute=" "
    if [[ -n "${substitutes[$1]+foobar}" ]]; then
        substitute=${substitutes[$1]}
    else
        substitute=$1
    fi
    echo $substitute
}

encode() {
    # Remove everything except alphanumeric characters, and convert to lowercase.
    text="$( echo $1 | tr -dc '[:alnum:]\n\r' | tr [A-Z] [a-z])"

    # Create a list of output characters.
    output_characters=()
    for ((i=0; i<${#text}; i++)); do
        letter=${text:i:1}
        output_characters+=("$(return_substitute_if_exists $letter)")
    done

    # Group into blocks of five characters and save in an array.
    len_output_characters=${#output_characters[@]}
    output_strings=()
    for ((i=0; i<$len_output_characters; i+=5)); do
        len_remaining=$(expr $len_output_characters - $i)
        len_next_section=$((len_remaining<5 ? len_remaining : 5))
        section=''
        for ((j=0; j<$len_next_section; j+=1)); do
            character=${output_characters[$i+$j]}
            section+="$character"
        done
        output_strings+=("$section")
    done

    # Concatenate output strings into one very long string.
    output=''
    for ((i=0; i<${#output_strings[@]}; i+=1)); do
        output+="${output_strings[$i]} "
    done

    echo $output
}

decode() {
    # Remove spaces from text
    text="$( echo $1 | tr -d ' ')"
    # Create a list of output characters.
    output_characters=()

    # Iterate over characters in the text.
    for ((i=0; i<${#text}; i++)); do
        # letter=${text:i:1}
        output_characters+=("$(return_substitute_if_exists ${text:i:1})")
        # output_characters+=("$substitute")
    done

    # Concatenate output strings into one very long string.
    output=''
    for ((i=0; i<${#output_characters[@]}; i+=1)); do
        output+="${output_characters[$i]}"
    done

    echo $output
}

if [[ $1 = "encode" ]]; then
    echo "$(encode "$2")"
fi

if [[ $1 = "decode" ]]; then
    echo "$(decode "$2")"
fi
