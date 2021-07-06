#!/bin/bash
#Any number of random number can be generated using below for loop
RANDOM=$$
for i in `seq 10`
do
	echo "$i,$RANDOM">>inputFile
done
