#!/bin/bash

Num1=$1
Num2=$2

# -gt  greater than
# -lt  less than
# -eq  equal to
# -ne  not equal to
# -ge  greater than or equal to
# -le  less than or equal to

if [ "$Num1" -gt "$Num2" ]; then
    echo "Given $Num1 is the greatest  number among two numbers"
elif [ "$Num1" -lt "$Num2" ]; then
    echo " Given $Num1 is the smallest among two numbers"
else
    echo "Both numbers are equal"
fi


read -p "Please enter your name:" username

entry=$(cat /etc/passwd | grep $username)
user_exist=$?
if [ $user_exist -eq 0 ];then
   echo "Valid user"
    su $username
else
   echo "Invalid user"
fi
