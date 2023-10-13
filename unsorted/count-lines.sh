#!/bin/bash

path=$1
# /mnt/c/to/f-i

total_lines=0

# Count Each File Lines / Count Each Folder's Files Total Lines ======================================================================================
for i in {1..10}; do
  folder="$path$i"
  echo "Counting lines in files in $folder"
#   find "$folder" -type f -exec wc -l {} \;
   find "$folder" -type f -exec cat {} \; | wc -l
done

# Count Files Total Lines In Same Folder =====================================================================
# for i in {1..10}; do
#   folder="$path$i"
#   lines_in_folder=$(find "$folder" -type f -exec cat {} \; | wc -l)
#   total_lines=$((total_lines + lines_in_folder))
# done
# echo "Total lines in all folders: $total_lines"
