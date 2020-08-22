#!/usr/local/bin/bash -x

#DICTIONARY
declare -A flipdictionary  					    #Stores singlet combination

#MAIN PROGRAM

read -p "Enter number of times you want to flip: " fliptimes
flipdictionary["H"]=0						    #initialize values stored in dictionary indices
flipdictionary["T"]=0

for (( count=0; count<$fliptimes; count++))			    #for loop to run multiple simulations
do
	flip_Result=$((RANDOM%2))				    #get flip result for current coin flip

	if [[ $flip_Result -eq 1 ]]
	then
		flipdictionary["H"]=$((${flipdictionary["H"]} + 1)) #increment heads if flip result is 1
	else 
		flipdictionary["T"]=$((${flipdictionary["T"]} + 1)) #increment tails if flip result is 0
	fi
done

singlet_percentage=`echo "scale=2; ${flipdictionary["H"]} / $fliptimes * 100" | bc -l |awk -F. '{print $1}'`  #Determine singlet percentage,display integral part

echo ${!flipdictionary[@]}					    #Print results
echo ${flipdictionary[@]}
echo "Singlet percentage: " $singlet_percentage			    
