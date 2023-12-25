#!/bin/bash

generate_report() {
    local input_file="$1"
    local output_file="$2"

    echo "Generating report ... Please wait a moment"
    awk -F',' 'BEGIN {OFS="X"; print "X,X"} NR>X {sum[$X] += $X} END { for (i in sum) print i, sum[i] }' "$input_file" > "${output_file}.tmp" #change X
    # awk -F',' 'BEGIN {OFS=","; print "Company,Total Revenue"} NR>1 {sum[$1] += $4} END { for (i in sum) print i, sum[i] }' "$input_file" > "${output_file}.tmp" 
    #summarize data for example

    echo "Company,Total Revenue" > "$output_file" #header, footer
    sed 's/,/ : /' "${output_file}.tmp" >> "$output_file"
    rm "${output_file}.tmp"
    echo "Report generated: $output_file"
}


echo "report_gen.sh completed successfully"
input_data="input_financial_data.csv" #CHANGE HERE
output_report="financial_report.txt"#CHANGE HERE
generate_report "$input_data" "$output_report"
