#!/bin/bash

# Input and output file paths
input_file="logfile.log.txt"
output_file="logfile_no_timestamps.log"

# Use sed to remove timestamps at the beginning of each line
sed -E 's/^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}\.[0-9]+Z //' "$input_file" > "$output_file"

echo "Timestamps removed. Cleaned log saved to $output_file"
