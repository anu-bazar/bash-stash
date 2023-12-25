#!/bin/bash

perform_data_cleaning() {
    local input_file="$1"
    local output_file="$2"
    echo "Performing data cleaning ... Please wait a moment"
    awk '!seen[$1]++' "$input_file" > "$output_file" #duplicates removed
    awk -F',' 'BEGIN {OFS=","} { if ($X == "") $X = 0; print }' "$output_file" > "${output_file}.tmp" && mv "${output_file}.tmp" "$output_file" #missing value column X replaced with 0

    echo "Data cleaning completed. Cleaned data saved to: $output_file"
}

echo "data_cleaning.sh ran successfully"
input_data="input_financial_data.csv" # CHANGE PATH HERE
output_data="cleaned_financial_data.csv" # CHANGE PATH HERE
perform_data_cleaning "$input_data" "$output_data"
