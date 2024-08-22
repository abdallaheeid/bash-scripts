#!/usr/bin/env bash

# Automated Thumbnail Generation

for filename in *.jpg; do
    
    if [[ ! -f "${filename}" ]]; then
        continue;
    fi

    extension="${filename##*.}"
    filename_no_ext="${filename%%.*}"
    thumbnail_file_name="${filename_no_ext}.thumbnail.${extension}"

    if [[ -f "${thumbnail_file_name}" ]]; then
        continue;
    fi

    width=$(identify -format '%w' "${filename}")
    height=$(identify -format '%h' "${filename}")

    if (( width > 100 || height > 100)); then
        magick "${filename}" -resize 100x100 "${thumbnail_file_name}" 
    fi

    echo "${filename}: ${extension} - ${filename_no_ext}"
    echo "${thumbnail_file_name}"

done

