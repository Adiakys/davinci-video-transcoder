#!/bin/bash

# Set input folder (default: current directory)
INPUT_FOLDER="${1:-.}"

# Set output folder (default: INPUT_FOLDER/transcoded)
OUTPUT_FOLDER="$INPUT_FOLDER/transcoded"

# Set input extensions (default: mp4 and mov)
IFS=',' read -r -a EXTENSIONS <<< "${2:-mp4,mov}"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_FOLDER"

# Loop through specified extensions
for ext in "${EXTENSIONS[@]}"; do
    for i in "$INPUT_FOLDER"/*."$ext"; do
        # Skip if no matching files exist
        [ -e "$i" ] || continue

        # Extract filename and base name
        filename=$(basename "$i")
        name="${filename%.*}"

        # Transcode
        ffmpeg -i "$i" -vcodec mjpeg -q:v 2 -acodec pcm_s16be -q:a 0 -f mov "$OUTPUT_FOLDER/${name}.mov"
    done
done