#!/bin/bash

read -p "Please enter a name to check if it is a palindrome: " Name

Reverse=$(echo $Name | rev)

if [ "$Name" == "$Reverse" ] ; then 
     echo " Given $Name is a palindrome"
else
     echo " Given $Name is not a palindrome"
fi