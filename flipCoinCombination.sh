#!/usr/local/bin/bash

flip_Result=$((RANDOM%2))                       #get flip result for current coin flip

if [[ $flip_Result -eq 1 ]]
then
	echo "Result of flip: HEADS"
else 
	echo "Result of flip: TAILS"
fi
