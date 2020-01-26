#!/bin/bash

PATH=/bin:/sbin:/usr/bin:/usr/sbin

echo -e "Amount due?"

read amountdue
echo -e "Amount Paid?"
read amountpaid

if (( $(echo "$amountdue > 50" |bc -l) )) || (( $(echo "$amountpaid > 50" |bc -l) ))
    then
        echo "Error. Amount greater than 50. Please run the program again with amount less than 50"
	exit 1;
fi

 
if (( $(echo "$amountpaid > $amountdue" |bc -l) ))
    then	
	echo -e "Please give customer:"
	a=$(echo "$amountpaid - $amountdue" | bc)
	while (( $(echo "$a > 0" |bc -l) ))
	do
		if (( $(echo "$a >= 20" |bc -l) ))
		then
			a_20=`perl -w -e "use POSIX; print floor($a/20.0), qq{\n}"`
			echo -e "$a_20 twenty dollar bill(s)"
			a=$(echo "$a - $a_20*20" | bc)
		elif (( $(echo "$a < 20" |bc -l) )) && (( $(echo "$a >= 10" |bc -l) ))	
		then
	                a_10=`perl -w -e "use POSIX; print floor($a/10.0), qq{\n}"`
                        echo -e "$a_10 ten dollar bill(s)"
                        a=$(echo "$a - $a_10*10" | bc)
        elif (( $(echo "$a < 10" |bc -l) )) && (( $(echo "$a >= 5" |bc -l) )) 
        then
                a_5=`perl -w -e "use POSIX; print floor($a/5.0), qq{\n}"`
                echo -e "$a_5 five dollar bill(s)"
                a=$(echo "$a - $a_5*5" | bc)
        elif (( $(echo "$a < 5" |bc -l) )) && (( $(echo "$a >= 1" |bc -l) ))
        then
                a_1=`perl -w -e "use POSIX; print floor($a/1.0), qq{\n}"`
                echo -e "$a_1 one dollar bill(s)"
                a=$(echo "$a - $a_1*1" | bc)
        elif (( $(echo "$a < 1" |bc -l) )) && (( $(echo "$a >= 0.25" |bc -l) ))
        then
                aquar=`perl -w -e "use POSIX; print floor($a/0.25), qq{\n}"`
                echo -e "$aquar quarter bill(s)"
                a=$(echo "$a - $aquar*0.25" | bc) 
        elif (( $(echo "$a < 0.25" |bc -l) )) && (( $(echo "$a >= 0.1" |bc -l) ))
        then
                adime=`perl -w -e "use POSIX; print floor($a/0.1), qq{\n}"`
                echo -e "$adime dime bill(s)"
                a=$(echo "$a - $adime*0.1" | bc)
        elif (( $(echo "$a < 0.1" |bc -l) )) && (( $(echo "$a >= 0.05" |bc -l) ))
        then
                anick=`perl -w -e "use POSIX; print floor($a/0.05), qq{\n}"`
                echo -e "$anick nickels bill(s)"
                a=$(echo "$a - $anick*0.05" | bc)
        elif (( $(echo "$a < 0.05" |bc -l) )) && (( $(echo "$a >= 0.01" |bc -l) ))
        then
                apenn=`perl -w -e "use POSIX; print floor($a/0.01), qq{\n}"`
                echo -e "$apenn pennies bill(s)"
                        a=$(echo "$a - $apenn*0.01" | bc)
			     a=0	
        fi
	done


 elif (( $(echo "$amountpaid == $amountdue" |bc -l) ))
    then
        echo -e "There is no amount to be given to the customer"
else
    echo -e "Amount Paid can not be less than Amount Due. Please run the program again"
 fi
