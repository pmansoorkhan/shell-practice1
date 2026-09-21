#!/bin/bash

echo "please enter your name:"
read Name

echo "please enter your passowrd:"
read -s Password  # "-s" denoted to keep the password value to be hidden while giving 

echo "your name is $Name"
echo "your password is $Password" # password will not be printed anywhere in production uses.