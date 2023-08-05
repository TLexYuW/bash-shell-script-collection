#!/bin/bash

echo "Enter filename to print from awk"
read filename

if [[ -f $filename ]]
then
    awk '/test/ {print $5}' $filename
else
    echo "$filename doesn't exist"
fi