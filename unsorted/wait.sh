#!/bin/bash

# Parallel Execute
printf "Doing something......\n"
sleep 3 &

printf "Doing something else......\n\n"
sleep 3 &

jobs -l

wait

printf "\n...and we're done!\n\n"