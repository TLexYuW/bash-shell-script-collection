#!/bin/bash

# Wrong!
# echo 30+20

# Correct
echo $((30+20))

echo "-----------------------------------"

n1=5
n2=25

echo $(( n1 + n2 ))
echo $(( n1 - n2 ))
echo $(( n1 * n2 ))
echo $(( n1 / n2 ))
echo $(( n1 % n2 ))

echo "-----------------------------------"

# expression
echo $( expr $n1 + $n2 )
echo $( expr $n1 - $n2 )
echo $( expr $n1 \* $n2 )
echo $( expr $n1 / $n2 )
echo $( expr $n1 % $n2 )