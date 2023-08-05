#!/bin/bash

url="https://jsonplaceholder.typicode.com/users"
curl ${url}

# download the file
# curl ${url} -O

# download and change file name
# curl ${url} -o [filename]