#!/bin/bash


# `two bracket`
# `-o`: OR, `-a`:all, &&

age=30

if [[ "$age" -gt 18 && "$age" -lt 40 ]]
then
	echo "Age is correct"
else
	echo "Age is not correct"
fi


