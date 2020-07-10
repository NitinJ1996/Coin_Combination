#!/bin/bash -x

#constants
heads=1
tails=0

read -p "Enter the no.of time to flip a coin: " num

#variables
head_count=0
tail_count=0


declare -A singlet

for ((i=0; i<$num; i++))
do
	coinflip=$((RANDOM%2))
	case $coinflip in
			$heads) singlet["H"]=$((++head_count)) ;;
			$tails) singlet["T"]=$((++tail_count)) ;;
			*) ;;
	esac
done

declare -A singlet_percent
for key in ${!singlet[@]}
do
		singlet_percent[$key]=`echo "scale=2; $((${singlet[$key]}))/$num*100" | bc`
done

echo "Signlet Combination: " ${!singlet[@]}
echo "Signlet Count: " ${singlet[@]}
echo "Singlet Percentage: "${singlet_percent[@]}
