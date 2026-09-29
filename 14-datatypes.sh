#!/bin/bash

Num1=$1
Num2=$2

Sum=$(( "$Num1" + "$Num2"))
echo " Sum of two numbersis : $Sum"

if [ "$Num1" -gt "$Num2" ]; then 
   echo "Difference of two numbers is : $(( "$Num1" - "$Num2" ))"

elif [ "$Num1" -lt "$Num2" ]; then 
   echo "Difference of two numbers is : $(( "$Num2"  - "$Num1"))"

else [ "$Num1" == "$Num2" ]; then
     echo "Both given numbers are equal"

fi





