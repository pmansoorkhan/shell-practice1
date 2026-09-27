#!/bin/bash

Num1=$1
Num2=$2

if [ "$Num1" -gt "$Num2" ]; then
    echo "Given $Num1 is the greatest  number among two numbers"
elif [ "$Num1" -lt "$Num2" ]; then
    echo " Given $Num1 is the smallest among two numbers"
else
    echo "Both numbers are equal"
fi
