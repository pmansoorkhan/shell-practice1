#!/bin/bash

echo "please enter your name:"
read Name

echo "please enter your passowrd:"
read -s Password  # "-s" denoted to keep the password value to be hidden while giving 

echo "please enter your mobile number:"
read Mobile_Number

echo "your name is $Name"
echo "your password is $Password" # password will not be printed anywhere in production uses.
echo "your mobile number is $Mobile_Number"