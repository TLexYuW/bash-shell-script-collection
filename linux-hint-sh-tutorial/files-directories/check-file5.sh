#!/bin/bash

# remove file
echo "Enter file name from which you want to delete"
read fileName

if [[ -f "$fileName" ]]
then
	#remove complete
	#rm $fileName
	#remove file to trash
	rm -rf $fileName
	echo "file has been deleted successfully"
else 
    echo "$fileName doesn't exist"
fi