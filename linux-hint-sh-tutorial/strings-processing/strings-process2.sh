#!/bin/bash

echo "enter 1st string"
read str1

echo "enter 2nd string"
read str2

if [[ "$str1" < "$str2" ]]
then
	echo "$str1 is smaller than $str2"
elif [[ "$str1" > "$str2" ]]
then
	echo "$str2 is smaller than $str1"
else
	echo "both strings are equal"
fi

: '
if [ "$str1" \< "$str2" ]
then
	echo "$str1 is smaller than $str2"
elif [ "$str1" \> "$str2" ]
then
	echo "$str2 is smaller than $str1"
else
	echo "both strings are equal"
fi
'