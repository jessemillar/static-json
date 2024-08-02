#!/bin/bash

# Count the number of lines in the CSV file where the "Exclusive Shelf" column is "read"
books_read=$(awk -F, '
BEGIN {
    OFS = FS
}
NR > 1 {
    # Combine fields if they are quoted and contain commas
    for (i = 1; i <= NF; i++) {
        if ($i ~ /^"/) {
            while ($i !~ /"$/) {
                $(i) = $(i) "," $(i+1)
                for (j = i+1; j < NF; j++) {
                    $(j) = $(j+1)
                }
                NF--
            }
            # Remove quotes
            gsub(/^"|"$/, "", $(i))
        }
    }
    if ($19 == "read") {
        count++
    }
}
END {
    print count
}' goodreads_library_export.csv)

# Create a JSON object and write it to goodreads.json
echo "{\"books_read\": $books_read}" > goodreads.json