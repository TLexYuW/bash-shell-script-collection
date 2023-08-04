#!/bin/bash

# `While` : 直到 `[ ]` 是 false 停止
# `do` 迴圈

number=1
while [ $number -lt 10 ]
do
	echo "$number"
	number=$(( number+1 ))
done