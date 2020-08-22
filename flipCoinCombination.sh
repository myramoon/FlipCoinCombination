#!/usr/local/bin/bash 

#DICTIONARY
declare -A flipdictionary  					    #Stores triplet combination
declare -A tripletpercent					    #Stores triplet percentage

#MAIN PROGRAM

read -p "Enter number of times you want to flip: " fliptimes

flipdictionary["HHH"]=0						    #initialize values stored in dictionary indices
flipdictionary["HHT"]=0
flipdictionary["HTH"]=0
flipdictionary["HTT"]=0
flipdictionary["THH"]=0
flipdictionary["THT"]=0
flipdictionary["TTH"]=0
flipdictionary["TTT"]=0 

for (( count=0; count<$fliptimes; count++))			    #for loop to run multiple simulations
do
	coin1=$((RANDOM%2))					    #get flip result for COIN1
	coin2=$((RANDOM%2))				    	    #get flip result for COIN2 
	coin3=$((RANDOM%2))					    #get flip result for COIN3

	case "$coin1$coin2$coin3" in				    #case statement to determine number of times each combination appeared				
	
		111)
		flipdictionary["HHH"]=$((${flipdictionary["HHH"]} + 1 ));;
		110)
		flipdictionary["HHT"]=$((${flipdictionary["HHT"]} + 1 ));;
		101)
		flipdictionary["HTH"]=$((${flipdictionary["HTH"]} + 1 ));;
		100)
		flipdictionary["HTT"]=$((${flipdictionary["HTT"]} + 1 ));;
		011)
                flipdictionary["THH"]=$((${flipdictionary["THH"]} + 1 ));;
                010)
                flipdictionary["THT"]=$((${flipdictionary["THT"]} + 1 ));;
                001)
                flipdictionary["TTH"]=$((${flipdictionary["TTH"]} + 1 ));;
                000)
                flipdictionary["TTT"]=$((${flipdictionary["TTT"]} + 1 ));;
	esac

done

tripletpercent["HHH%"]=`echo "scale=2; ${flipdictionary["HHH"]} / $fliptimes * 100" | bc -l |awk -F. '{print $1 "%"}'`  #Determine triplet percentage,display integral part
tripletpercent["HHT%"]=`echo "scale=2; ${flipdictionary["HHT"]} / $fliptimes * 100" | bc -l |awk -F. '{print $1 "%"}'`
tripletpercent["HTH%"]=`echo "scale=2; ${flipdictionary["HTH"]} / $fliptimes * 100" | bc -l |awk -F. '{print $1 "%"}'`
tripletpercent["HTT%"]=`echo "scale=2; ${flipdictionary["HTT"]} / $fliptimes * 100" | bc -l |awk -F. '{print $1 "%"}'`
tripletpercent["THH%"]=`echo "scale=2; ${flipdictionary["THH"]} / $fliptimes * 100" | bc -l |awk -F. '{print $1 "%"}'`
tripletpercent["THT%"]=`echo "scale=2; ${flipdictionary["THT"]} / $fliptimes * 100" | bc -l |awk -F. '{print $1 "%"}'`
tripletpercent["TTH%"]=`echo "scale=2; ${flipdictionary["TTH"]} / $fliptimes * 100" | bc -l |awk -F. '{print $1 "%"}'`
tripletpercent["TTT%"]=`echo "scale=2; ${flipdictionary["TTT"]} / $fliptimes * 100" | bc -l |awk -F. '{print $1 "%"}'`

echo ${!flipdictionary[@]}					    #Print triplet appearances
echo ${flipdictionary[@]}
echo ${!tripletpercent[@]}                                          #Print triplet percentage
echo ${tripletpercent[@]}

