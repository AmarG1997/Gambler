#!/bin/bash -x
echo "Welcome to the gambler"

STAKE=100
BETS=1

cash=$STAKE

maxLimit=$(($STAKE+(50*$STAKE/100)))
minLimit=$(($STAKE-(50*$STAKE/100)))

function gamblingForDay()
{
while [[ $cash -lt $maxLimit && $cash -gt $minLimit ]]
do
	gamblerResult=$((RANDOM%2))
	if [ $gamblerResult -eq 0 ]
	then
		cash=$(($cash+1))
	else
		cash=$(($cash-1))
	fi

done
	echo "cash : "$cash
}

gamblingForDay
