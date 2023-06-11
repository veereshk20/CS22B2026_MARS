#!/bin/bash

# Function to transpose a matrix
transpose_matrix() {
    local matrix=("$@")
    local rows=${#matrix[@]}
    local cols=${#matrix[0]}

    # Create a new transposed matrix
    local transposed_matrix=()
    for ((col = 0; col < cols; col++)); do
        local transposed_row=""
        for ((row = 0; row < rows; row++)); do
            transposed_row+=" ${matrix[row]:$col:1}"
        done
        transposed_matrix+=("${transposed_row:1}")
    done

    # Print the transposed matrix in standard 2D matrix format
    for row in "${transposed_matrix[@]}"; do
        echo "$row"
    done
}

# Read the matrix file name from user input
read -p "Enter the matrix file name: " matrix_file

# Read the matrix from the file into an array
matrix=()
while IFS= read -r line; do
    matrix+=("$line")
done < "$matrix_file"

# Transpose the matrix
transposed_matrix=$(transpose_matrix "${matrix[@]}")

echo "Transposed Matrix:"
echo "$transposed_matrix"

