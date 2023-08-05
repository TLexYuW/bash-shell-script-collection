#!/bin/bash

# `>` : remove and replace

echo "Enter file name to check"
read fileName

if [[ -f "$fileName" ]]
then
    echo "Enter the text that you want to remove and replace"
    read fileText
    echo "$fileText" > $fileName
else
    echo "$fileName doesn't exist"
fi