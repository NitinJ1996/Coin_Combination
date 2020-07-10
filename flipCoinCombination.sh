#!/bin/bash -x

coinflip=$((RANDOM%2))
case $coinflip in
		1) echo "HEADS" ;;
		*) echo "TAILS" ;;
esac
