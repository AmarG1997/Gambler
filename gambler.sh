#!/bin/bash -x
echo "Welcome to the gambler"

BETS=1
DAY=20

totalEarn=0

declare -A gamblerResultDict

function gamblingForDay()
{
		local cashResult=0

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
		cashResult=$(($cash+$cashResult))

		echo "$cash $cashResult"
}

function main()
{
	for (( i=1; i<=$DAY ;i++ ))
	do
		read cash cashResult < <( gamblingForDay )
		totalEarn=$(($totalEarn+$cash))
		gamblerResultDict["DAY$i"]="$cashResult $totalEarn"
	done

	for (( p=1; p<=${#gamblerResultDict[@]}; p++ ))
	do
		echo "Day $p ${gamblerDict[DAY$p]}"
	done

	for (( j=1; j<=${#gamblerResultDict[@]}; j++ ))
	do
		echo "Day $j	${gamblerResultDict[DAY$j]}"
	done | sort -k4 -nr | awk 'NR==1{print "luckiest day :" ($1$2"        "   $4)}'

	for (( j=1; j<=${#gamblerResultDict[@]}; j++ ))
	do
		echo "Day $j ${gamblerResultDict[DAY$j]}"
	done | sort -k4 -n | awk 'NR==1{print "Unluckiest day :" ($1$2"        "   $4)}'

	echo "Total Earn : $totalEarn"

	while [ $totalEarn -gt 0 ]
	do
		main
	done

}

main
