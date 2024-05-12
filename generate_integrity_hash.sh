#!/bin/bash

# Directory containing the resources
directory="./resources/"

# Loop through each .js file in the directory
for filepath in "$directory"*.js; do
    # Skip if directory is empty
    [ -e "$filepath" ] || continue

    # Calculate the sha384 hash and encode it in base64
    integrity=$(openssl dgst -sha384 -binary "$filepath" | openssl base64 -A)

    # Extract the filename from the path
    filename=$(basename "$filepath")

    # Print the <script> tag with the integrity attribute
    echo "<script src=\"${directory}${filename}\" integrity=\"sha384-${integrity}\" crossorigin=\"anonymous\"></script>"
done

