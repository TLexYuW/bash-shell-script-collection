#!/bin/bash

echo "Enter filename to substitute using sed"
read filename

if [[ -f $filename ]]
then
    cat file.txt | sed 's/i/I/'

    echo "-----------------------------------"

    # g => global
    cat file.txt | sed 's/s/S/g'

    echo "-----------------------------------"

    cat file.txt | sed 's/T/t/g' > newfile.txt
    
    echo "-----------------------------------"

    sed -i 's/Linux/Unix/g' "$filename"
    cat "$filename"

    echo "-----------------------------------"

    cat newfile.txt 
else
    echo "$filename dosen't exist"
fi