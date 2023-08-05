#!/bin/bash

echo "Enter directory name to check"
read direct

if [ -d "$direct" ]
then
	echo "$direct exists"
else
	echo "$direct doesn't exist"
fi