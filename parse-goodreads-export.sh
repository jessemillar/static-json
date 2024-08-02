#!/bin/bash

# Count the number of lines in the CSV file
line_count=$(wc -l < goodreads_library_export.csv)

# Subtract 1 to exclude the header row
books_read=$((line_count - 1))

# Create a JSON object and write it to goodreads.json
echo "{\"books_read\": $books_read}" > goodreads.json