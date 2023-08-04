#!/bin/bash

# `until`: 直到 `[ ]`  是 true 停止 
# `do` 迴圈

number=1
until [ $number -gt 10 ]
do
	echo "$number"
	number=$(( number+1 ))
done