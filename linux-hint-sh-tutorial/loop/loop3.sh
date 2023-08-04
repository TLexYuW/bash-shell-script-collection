#! /bin/bash

# For Loop
# format-1
echo "[format-1]==================================="
for i in 1 2 3 4 5
do
	echo $i
done

# format-2
echo "[format-2]==================================="
for i in {0..10}
do
	echo $i
done

# format-3
echo "[format-3]==================================="
for i in {0..10..2} #{start..ending..increment}
do
	echo $i
done

# format-4
echo "[format-4]==================================="
for (( i=0; i<5; i++ ))
do
	echo $i
done
