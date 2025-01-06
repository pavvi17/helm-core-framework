#!/bin/bash

# Input and output file paths passed as arguments
input_file_1="$1"
input_file_2="$2"

output_file_1="master_1_Set up job.txt"
output_file_2="branch_1_Set up job.txt"

# Use sed to remove timestamps at the beginning of each line from the first input file
sed -E 's/^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}\.[0-9]+Z //' "$input_file_1" > "$output_file_1"

# Use sed to remove timestamps from the second input file
sed -E 's/^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}\.[0-9]+Z //' "$input_file_2" > "$output_file_2"

echo "Timestamps removed. Cleaned logs saved to $output_file_1 and $output_file_2"
