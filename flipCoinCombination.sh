#!/usr/local/bin/bash 

#PROGRAM SUMMARY: User is asked the number of times flip is required.For each combination (SINGLET|DOUBLET|TRIPLET),the following is done:
# for loop to simulate the flip for reqd times. The values for each type in the combination are stored in an array.
#Finally the array containing all values is sorted and maximum value noted.The keys in the dictionary having this maximum value are determined and printed.


#ARRAY
declare -a sortarray						    #Sorts and stores values in dictionary 

#DICTIONARY
declare -A flipdictionary  					    #Stores singlet,doublet and triplet combinations

#MAIN PROGRAM

#SINGLET >>>>>>>>>>>>>>>>>>>>>>>

read -p "Enter number of times you want to flip: " fliptimes

flipdictionary["H"]=0                                               #initialize values stored in dictionary indices for SINGLET
flipdictionary["T"]=0

for (( count=0; count<$fliptimes; count++))                         #for loop to run multiple simulations
do
        flip_Result=$((RANDOM%2))                                   #get flip result for current coin flip

        if [[ $flip_Result -eq 1 ]]
        then
                flipdictionary["H"]=$((${flipdictionary["H"]} + 1)) #increment heads if flip result is 1
        else
                flipdictionary["T"]=$((${flipdictionary["T"]} + 1)) #increment tails if flip result is 0
        fi
done

sortarray[0]=${flipdictionary["H"]}				    #store values in dictionary into array
sortarray[1]=${flipdictionary["T"]}

#DOUBLET >>>>>>>>>>>>>>>>>>>>>>>>

flipdictionary["HH"]=0                                              #initialize values stored in dictionary indices for DOUBLET
flipdictionary["HT"]=0
flipdictionary["TH"]=0
flipdictionary["TT"]=0

for (( count=0; count<$fliptimes; count++))                         #for loop to run multiple simulations
do
        coin1=$((RANDOM%2))                                         #get flip result for COIN1
        coin2=$((RANDOM%2))                                         #get flip result for COIN2

        case "$coin1$coin2" in                                      #case statement to determine number of times each combination appeared                   $

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
sortarray[2]=${flipdictionary["HH"]}				    #store values in dictionary into array
sortarray[3]=${flipdictionary["HT"]}
sortarray[4]=${flipdictionary["TH"]}
sortarray[5]=${flipdictionary["TT"]}

#TRIPLET >>>>>>>>>>>>>>>>>>>>>>>>>>>


flipdictionary["HHH"]=0						    #initialize values stored in dictionary indices for TRIPLET
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

sortarray[6]=${flipdictionary["HHH"]}
sortarray[7]=${flipdictionary["HHT"]}
sortarray[8]=${flipdictionary["HTH"]}
sortarray[9]=${flipdictionary["HTT"]}
sortarray[10]=${flipdictionary["THH"]}
sortarray[11]=${flipdictionary["THT"]}
sortarray[12]=${flipdictionary["TTH"]}
sortarray[13]=${flipdictionary["TTT"]}

echo ${!flipdictionary[@]}					    
echo ${flipdictionary[@]}

for (( count=0; count<=12; count++)) 				   #loop to sort array
do
	for ((index=0; index<=12; index++ ))
	do
		if [[ ${sortarray[index]} -gt ${sortarray[$((index+1))]} ]]
        	then
                	temp=${sortarray[index]}
                	sortarray[index]=${sortarray[$((index+1))]}
                	sortarray[$((index+1))]=$temp

		fi	
	done
done

echo "sortarray"${sortarray[@]}					   #Print sorted array
max=${sortarray[13]}						   #Find maximum value

echo "The winning combination(s) is/are : "
for key in ${!flipdictionary[@]}				   #Find keys having maximum value and print them
do
	if [[ ${flipdictionary[$key]} -eq $max ]]
	then
		echo $key
	fi
done
