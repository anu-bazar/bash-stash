#!/bin/bash

perform_data_aggregation() {
    local input_file="$1"
    local output_file="$2"
    local key_column="$3"
    local value_column="$4"

    echo "Performing data aggregation... Please wait a moment"

    awk -F',' -v key_col="$key_column" -v val_col="$value_column" 'BEGIN {OFS=","} {sum[$key_col] += $val_col} END { for (i in sum) print i, sum[i] }' "$input_file" > "$output_file" #MERGE ON KEY COLUMN 

    echo "Data aggregation completed. Output saved to: $output_file"
}

echo "data_aggregation.sh ran successfully"


input_data="input_financial_data.csv"
output_data="aggregated_financial_data.csv"
key_col=1  #column number of key col
value_col=4  #column number of value col

perform_data_aggregation "$input_data" "$output_data" "$key_col" "$value_col"
