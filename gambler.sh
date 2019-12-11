#!/bin/bash -x
echo "Welcome to the gambler"

BETS=1
DAY=20

totalWin=0
totalLoss=0
declare -A gamblerDict

function gamblingForDay()
{
for (( i=0; i<DAY ;i++ ))
do
	stake=100
	maxLimit=$(($stake+(50*$stake/100)))
	minLimit=$(($stake-(50*$stake/100)))
	win=0
	loss=0
	while [[ $stake -lt $maxLimit && $stake -gt $minLimit ]]
	do
	gamblerResult=$((RANDOM%2))
		if [ $gamblerResult -eq 0 ]
		then
			stake=$(($stake+1))
			win=$(($win+1))
		else
			stake=$(($stake-1))
			loss=$(($loss+1))
		fi
	done
	cash=$(($stake-100))
	gamblerDict["DAY$i"]="$cash "

	totalEarn=$(($totalEarn+$cash))
done

DAY=$(($DAY+1))

}

gamblingForDay

for (( j=0; j<${#gamblerDict[@]}; j++ ))
do
	echo "Day $j		${gamblerDict[DAY$j]}"
done

echo "Total Earn : "$totalEarn
