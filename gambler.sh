#!/bin/bash -x
echo "Welcome to the gambler"

STAKE=100
BETS=1

gamblerResult=$((RANDOM%2))

if [ $gamblerResult -eq 0 ]
then
	echo "Win"
else
	echo "Loss"
fi
