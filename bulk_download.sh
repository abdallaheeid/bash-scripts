#!/usr/bin/env bash

##### remove image before running the script
rm *.jpg

base_url="https://downloads.codingcoursestv.eu/055%20-%20bash/while/images/"
image_ext="jpg"
image_num=1
notfound=0

while true; do
    if curl -o "image-${image_num}.${image_ext}" -f "${base_url}image-${image_num}.${image_ext}" --silent; then
        echo "Downloading image-${image_num}"
        (( image_num = image_num + 1 ))
    else
        (( notfound = notfound + 1 ))
        if (( notfound >= 10 )); then
            break
        fi
    fi
done

echo "The program has ended and the number of downloaded images are: $((image_num - 1))"
