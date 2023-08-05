#!/bin/bash

echo "Enter filename to print from awk"
read filename

if [[ -f $filename ]]
then
    awk '/windows/ {print}' $filename
else
    echo "$filename doesn't exist"
fi