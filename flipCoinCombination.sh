#!/bin/bash -x

#dictionaries
declare -A coinCombination
declare -A combination_percent


#function to generate toss
function coinflip(){
        toss=$((RANDOM%2))
        case $toss in
                1) echo "H" ;;
                *) echo "T" ;;
        esac
}

#function to calculate combination percentage
function percentageCal(){
for key in ${!coinCombination[@]}
do
                combination_percent[$key]=`echo "scale=2; ($((${coinCombination[$key]}))*100)/$num" | bc`
done
}

read -p "Enter the no.of time to flip a coin: " num

#variables
h=0
t=0

#creating dictionary for singlet
for ((i=0; i<$num; i++))
do
	flip=$( coinflip )
	case $flip in
		H) coinCombination[$flip]=$((++h)) ;;
		T) coinCombination[$flip]=$((++t)) ;;
			*) ;;
	esac
done

percentageCal

echo "Signlet Combination: " ${!coinCombination[@]}
echo "Signlet Count: " ${coinCombination[@]}
echo "Singlet Percentage: "${combination_percent[@]}
