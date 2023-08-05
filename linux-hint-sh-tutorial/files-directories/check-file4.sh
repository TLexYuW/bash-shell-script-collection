#!/bin/bash

# read file line by line

echo "Enter file name from which you want to read"
read fileName

if [[ -f "$fileName" ]]
then
    while IFS= read -r line
    do
        echo "$line"
    done < $fileName
else 
    echo "$fileName doesn't exist"
fi