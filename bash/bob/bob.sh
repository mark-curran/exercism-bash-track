#!/usr/bin/env bash

bob () {
    is_question=$1
    is_uppercase=$2
    no_input=$3
    
    # If a question but not all uppercase;
    if ( (! $is_uppercase) && $is_question); then
        echo "Sure."
        exit 0
    fi

    # If all uppercase but not a question;
    if ( (! $is_question) && $is_uppercase); then
        echo "Whoa, chill out!"
        exit 0
    fi

    # If all uppercase and a question
    if ($is_question && $is_uppercase); then
        echo "Calm down, I know what I'm doing!"
        exit 0
    fi

    # No input
    if $no_input; then
        echo "Fine. Be that way!"
        exit 0 
    fi

    # None of the above
    echo "Whatever."
    exit 0
}

# Check is a question or not
remove_whitespace="$( echo $1 | tr -d '\011\012\013\014\015\040')"
if [[ "${remove_whitespace: -1}" == '?' ]]; then
    is_question=true
else 
    is_question=false
fi

# check if input is empty after removing spaces
if [[ -z "${remove_whitespace}" ]]; then
    no_input=true
else
    no_input=false
fi 

# Check if all upper case or not
remove_special_chars="$( echo $1 | tr -dc '[:alpha:]')"
if [[ "$remove_special_chars" =~ [A-z] ]]; then
    some_letters=true
else
    some_letters=false
fi

if ($some_letters) && [ "$1" == "$( echo $1 | tr [a-z] [A-Z])" ]; then
    is_uppercase=true
else
    is_uppercase=false
fi


bob $is_question $is_uppercase $no_input