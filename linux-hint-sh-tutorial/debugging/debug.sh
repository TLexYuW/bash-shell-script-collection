#!/bin/bash -x

echo "Enter filename to substitute using sed"
read filename

if [[ -f $filename ]]
then
    sed -i 's/Windows/win10/g' $filename
else
    echo "$filename dosen't exist"
fi