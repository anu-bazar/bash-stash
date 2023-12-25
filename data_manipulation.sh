#!/bin/bash


# sort_data "$input_file1" "$output_sorted"
# filter_data "$input_file1" "$output_filtered" "keyword"
# join_datasets "$input_file1" "$input_file2" "$output_joined"


sort_data() {
    local input_file="$1"
    local output_file="$2"

    echo "Sorting data...Please wait a moment"
    sort -t',' -k2 "$input_file" > "$output_file"
    echo "Data sorted. Sorted data saved to: $output_file"
}

filter_data() {
    local input_file="$1"
    local output_file="$2"
    local filter_keyword="$3"

    echo "Filtering data...Please wait a moment"
    grep "$filter_keyword" "$input_file" > "$output_file"
    echo "Data filtered. Filtered data saved to: $output_file"
}

join_datasets() {
    local input_file1="$1"
    local input_file2="$2"
    local output_file="$3"

    echo "Joining datasets...Please wait a moment"
    join -t',' -1 1 -2 1 "$input_file1" "$input_file2" > "$output_file"
    echo "Datasets joined. Result saved to: $output_file"
}


echo "Data Manipulation Script"

input_file1="input_data1.csv"
input_file2="input_data2.csv"
output_sorted="sorted_data.csv"
output_filtered="filtered_data.csv"
output_joined="joined_data.csv"



