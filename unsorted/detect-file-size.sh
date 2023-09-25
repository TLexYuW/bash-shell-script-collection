#!/bin/bash

log_file="/path/to/file.log"
max_size_kb=120 # kilobytes

# Check if the log file exists
if [ -f "$log_file" ]; then
    # Get the current file size in kilobytes
    file_size_kb=$(du -s "$log_file" | cut -f1)
    # Check if the file size exceeds the maximum allowed size
    if [ "$file_size_kb" -gt "$max_size_kb" ]; then
        # Empty the log file
        > "$log_file"
        echo "Log file exceeded and has been emptied."
    else
        echo "not exceed yet"
    fi
fi
