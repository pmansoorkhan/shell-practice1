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





## User validation using if else loop

read -p "Please enter your name:" username  # -p is used to prompt input from user
entry=$(cat /etc/passwd | grep $username) 
user_exist=$?    #$? is used to get the exit status of the last command executed. If the command was successful, it returns 0; otherwise, it returns a non-zero value.
if [ $user_exist -eq 0 ];then  
   echo "Valid user"
    su $username  # su command is used to switch to another user account in Linux. It allows you to execute commands with the privileges of the specified user.
else
   echo "Invalid user"
fi
