#!/bin/bash

# Function to append current date and time to each file
append_datetime() {
    local dir="$1"

    # Loop through each file in the directory
    for file in "$dir"/*; do
        if [[ -f "$file" ]]; then
            # Get the current date and time in the format: DD-MM-YYYY HH:MM:SS
            datetime=$(date +"%d-%m-%Y %H:%M:%S")

            # Append the date and time to the file
            echo -e "\nAppended on: $datetime" >> "$file"
        fi
    done
}

# Read the current working directory from user input
read -p "Enter the Current Working Directory: " cwd

# Specify the Modified directory
modified_dir="${cwd}/modified"

# Call the append_datetime function with the Modified directory
append_datetime "$modified_dir"

echo "Date and time have been appended to each file in the Modified directory."

