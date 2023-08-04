#! /bin/bash

# ./stdin5.sh /path/to/document.txt
while read line
do
	echo "$line"
done < "${1:-/dev/stdin}"