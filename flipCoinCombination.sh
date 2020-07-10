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
h=0;t=0;hh=0;ht=0;th=0;tt=0;
hhh=0;hht=0;hth=0;thh=0;tth=0;tht=0;
htt=0;ttt=0

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

#extending dictionary for doublet
for((i=0; i<$num; i++))
do
	flip=$( coinflip )$( coinflip )
   echo $flip
   case $flip in
      HH) coinCombination[$flip]=$(( ++hh )) ;;
      TT) coinCombination[$flip]=$(( ++tt )) ;;
      HT) coinCombination[$flip]=$(( ++ht )) ;;
      TH) coinCombination[$flip]=$(( ++th )) ;;
      *) ;;
   esac
done

#creating dictionary for triplet
for((i=0; i<$num; i++))
do
   flip=$( coinflip )$( coinflip )$( coinflip )
	case $flip in
		HHH) coinCombination[$flip]=$(( ++hhh )) ;;
		HHT) coinCombination[$flip]=$(( ++hht )) ;;
		HTH) coinCombination[$flip]=$(( ++hth )) ;;
		THH) coinCombination[$flip]=$(( ++thh )) ;;
		TTH) coinCombination[$flip]=$(( ++tth )) ;;
		THT) coinCombination[$flip]=$(( ++tht )) ;;
		HTT) coinCombination[$flip]=$(( ++htt )) ;;
		TTT) coinCombination[$flip]=$(( ++ttt )) ;;
		*) ;;
	esac
done

percentageCal

echo "Coin Combination: " ${!coinCombination[@]}
echo "Combination Count: " ${coinCombination[@]}
echo "Combination Percentage: "${combination_percent[@]}
