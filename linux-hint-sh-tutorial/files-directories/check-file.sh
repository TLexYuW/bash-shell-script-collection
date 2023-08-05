#!/bin/bash

echo "Enter File name to check"
read fileName

if [[ -f "$fileName" ]]
then
    echo "$fileName exists"
else
    echo "$fileName doesn't exist"
fi