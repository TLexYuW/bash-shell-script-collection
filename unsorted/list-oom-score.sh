#!/bin/bash

while read -r pid comm; do 
  printf '%d\t%d\t%s\n' "$pid" "$(cat /proc/$pid/oom_score)" "$comm"
done < <(ps -e -o pid= -o comm=)