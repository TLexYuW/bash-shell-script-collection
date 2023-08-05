#!/bin/bash

set -x

echo "Enter filename to substitute using sed"
read filename

set +x

if [[ -f $filename ]]
then
    sed -i 's/2000/8000/g' $filename
else
    echo "$filename dosen't exist"
fi