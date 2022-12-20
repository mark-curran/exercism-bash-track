#!/usr/bin/env bash

# Taken largely from: https://exercism.io/tracks/bash/exercises/acronym/solutions/4d2d218260904508855e2471987b7d5e

  main () {
    # Take the input and replace the characters * _ and - with blank space.
    string=$(echo "$1" | tr '*_-' ' ')
    result=""
    # Iterate over the words in $string
    for val in $string; do
        character="${val:0:1}"
        result+="$character"
    done
    echo "$result" | tr '[a-z]' '[A-Z]'
  }

  # call main with all of the positional arguments
  main "$@"