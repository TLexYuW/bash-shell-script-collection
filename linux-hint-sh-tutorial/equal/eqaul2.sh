#!/bin/bash

count=10

if (( $count < 9 ))
then
	echo "first condition is true"
elif (( $count > 9 ))
then
	echo "second condition is true"
else
	echo "the condition is false"
fi