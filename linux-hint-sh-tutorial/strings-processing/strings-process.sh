#!/bin/bash

echo "enter 1st string"
read str1

echo "enter 2nd string"
read str2

if [[ "$str1" == "$str2" ]]
then
	echo "strings match"
else
	echo "string not match"
fi