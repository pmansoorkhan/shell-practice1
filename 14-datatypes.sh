#!/bin/bash

Num1=$1
Num2=$2

Sum=$(( "$Num1" + "$Num2"))
echo "Sum of two numbers is : $Sum"

if [ "$Num1" -gt "$Num2" ]; then 
   echo "Difference of two numbers is : $(( "$Num1" - "$Num2" ))"

elif [ "$Num1" -lt "$Num2" ]; then 
   echo "Difference of two numbers is : $(( "$Num2"  - "$Num1"))"

else [ "$Num1" == "$Num2" ]
     echo "Both given numbers are equal"

fi

echo "Product of two numbers is : $(("$Num1" * "$Num2"))"

### Array of fruits ####

Fruits=("Apple" "Banana" "Mango" "Grapes" "Orange" "Pineapple")
echo "Given fruits are : ${Fruits[@]}"
echo "first fruit is : ${Fruits[0]}"
echo "Second fruit is : ${Fruits[1]}"
echo "Third fruit is : ${Fruits[2]}"
echo "Fourth fruit is : ${Fruits[3]}"
echo "Fifth fruit is : ${Fruits[4]}"
echo "Sixth fruit is : ${Fruits[5]}"



for fruit in "${Fruits[@]}"; do
  echo $fruit
done