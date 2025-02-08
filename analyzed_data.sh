#!/bin/bash

# Ensure directories exist
mkdir -p analyzed_data raw_data

# Task 1: Cleanup
mv rename_directory analyzed_data 2>/dev/null
rm dummy dummy-2.txt dummy-3.txt 2>/dev/null
mv satelite_temperature_data.csv raw_data/ 2>/dev/null

# Task 2: Analysis
# Extract top 10 highest temperatures
tail -n +2 raw_data/satelite_temperature_data.csv | sort -t, -k3,3nr | head -n 10 > analyzed_data/highest_temp.csv

# Extract data for Rwanda sorted by humidity 
grep ",Kenya," raw_data/satelite_temperature_data.csv | sort -t, -k4,4nr > analyzed_data/humidity_data_Kenya.csv

echo "Data analysis completed."
