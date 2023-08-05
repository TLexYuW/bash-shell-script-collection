#! /bin/bash

car=('BMW' 'Tesla' 'Toyota' 'Ford')

echo "${car[@]}"

echo "${car[1]}"

# display index
echo "${!car[@]}"

# how many values in array 
echo "${#car[@]}"

# Change value
car[2]='Mercedese'

echo "${car[@]}"