#!/bin/bash

# Count the number of lines in the CSV file where the "Exclusive Shelf" column is "read"
books_read=$(awk -F, 'NR > 1 && $19 == "read"' goodreads_library_export.csv | wc -l)

# Create a JSON object and write it to goodreads.json
echo "{\"books_read\": $books_read}" > goodreads.json