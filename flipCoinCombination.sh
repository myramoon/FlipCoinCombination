#!/usr/local/bin/bash 

#DICTIONARY
declare -A flipdictionary  					    #Stores doublet combination

#MAIN PROGRAM

read -p "Enter number of times you want to flip: " fliptimes
flipdictionary["HH"]=0						    #initialize values stored in dictionary indices
flipdictionary["HT"]=0
flipdictionary["TH"]=0
flipdictionary["TT"]=0

for (( count=0; count<$fliptimes; count++))			    #for loop to run multiple simulations
do
	coin1=$((RANDOM%2))					    #get flip result for COIN1
	coin2=$((RANDOM%2))				    	    #get flip result for COIN2 
	
	case "$coin1$coin2" in				            #case statement to determine number of times each combination appeared				
	
		11)
		flipdictionary["HH"]=$((${flipdictionary["HH"]} + 1 ));;
		10)
		flipdictionary["HT"]=$((${flipdictionary["HT"]} + 1 ));;
		01)
		flipdictionary["TH"]=$((${flipdictionary["TH"]} + 1 ));;
		00)
		flipdictionary["TT"]=$((${flipdictionary["TT"]} + 1 ));;
	esac

done

flipdictionary["HH%"]=`echo "scale=2; ${flipdictionary["HH"]} / $fliptimes * 100" | bc -l |awk -F. '{print $1 "%"}'`  #Determine doublet percentage,display integral part
flipdictionary["HT%"]=`echo "scale=2; ${flipdictionary["HT"]} / $fliptimes * 100" | bc -l |awk -F. '{print $1 "%"}'`
flipdictionary["TH%"]=`echo "scale=2; ${flipdictionary["TH"]} / $fliptimes * 100" | bc -l |awk -F. '{print $1 "%"}'`
flipdictionary["TT%"]=`echo "scale=2; ${flipdictionary["TT"]} / $fliptimes * 100" | bc -l |awk -F. '{print $1 "%"}'`

echo ${!flipdictionary[@]}					    #Print results
echo ${flipdictionary[@]}

