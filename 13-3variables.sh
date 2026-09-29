#!/bin/bash

Num1=$1
Num2=$2
Num3=$3

if [ "$Num1" -gt "$Num2" ] && [ "$Num1" -gt "$Num3" ]; then 
    echo "Given $Num1 is the greatest number among three numbers"
elif [ "$Num2" -gt "$Num1" ] && [ "$Num2" -gt "$Num3" ]; then
    echo "Given $Num2 is the greatest number among three numbers"
else
    echo "Given $Num3 is the greatest number among three numbers"

fi