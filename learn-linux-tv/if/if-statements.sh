#!/bin/bash

mynum=300

if [ $mynum -eq 200 ]
then
    echo "The condition is true."
else
    echo "Not equal 200"
fi

pwd "~/if-statements.sh"

if [ -f if-statements.sh ]
then
    echo "The file exists."
else
    echo "The file does not exists."
fi

# command=/usr/bin/htop
# if [ -f $command ]

command=htop
if command -v $command
then
    echo "$command is available!"
else
    echo "$command is not available"
    # sudo apt update && sudo apt install -y htop
fi

# $command