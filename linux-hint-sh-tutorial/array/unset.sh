#! /bin/bash

car=('BMW' 'Tesla' 'Toyota' 'Ford')

unset car[2]

echo "${car[@]}"
