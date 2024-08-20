#!/usr/bin/env bash

# TODO 1: Download the ebook only when needed

url="https://downloads.codingcoursestv.eu/055%20-%20bash/if/"
filename="romeo.txt"

if [[ -e "${filename}" ]]; then
    echo "The file already exists in the current directory." >&2
else
    echo "Downloading file (Romeo and Juliet)..."
    wget -O "${filename}" "${url}${filename}" > /dev/null
fi

# TODO 2: How many lines contain the word 'Love' at least one
count=$(grep -ic 'love' "${filename}")

# Output the result
echo "The word 'love' appears in $count lines."