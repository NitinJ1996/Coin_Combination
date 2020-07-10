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

function percentageCal(){

for key in ${!coinCombination[@]}
do
                combination_percent[$key]=`echo "scale=2; $((${coinCombination[$key]}))/$num*100" | bc`
done
}

read -p "Enter the no.of time to flip a coin: " num

#variables
h=0
t=0
hh=0
ht=0
th=0
tt=0

#creating dictionary for singlet
for ((i=0; i<$num; i++))
do
	cointoss=$( coinflip )
	case $cointoss in
		$cointoss) coinCombination[$cointoss]=$((++h)) ;;
		$cointoss) coinCombination["T"]=$((++t)) ;;
			*) ;;
	esac
done

percentageCal

echo "Signlet Combination: " ${!coinCombination[@]}
echo "Signlet Count: " ${coinCombination[@]}
echo "Singlet Percentage: "${combination_percent[@]}
