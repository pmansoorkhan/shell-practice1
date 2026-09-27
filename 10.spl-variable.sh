#!/bin/bash 

**********************
Topic: shell variables and its usage
Owner: Mansoor Khan
Date: 22nd_Sept_2026
**********************  

echo "print the  name of the script:$0"
echo "print the 1st argument:$1"
echo "print the 2nd argument :$2"
echo "print the 3rd argument :$3"
echo "print the total number of arguments :$#"
echo "print all the arguments :$@"
echo "print all the arguments as one :$*"
sleep 10
echo "print the exit status of the previous command :$?"
echo "print the PID of the current shell/script :$$"
echo "print the PID of the current Bash process :$BASHPID"
echo "print the who is running the script:$USER"
echo "print the home directory of the user:$HOME"
sleep 5
echo "print the PID of the most recently executed background process :$!"
echo "print the current shell options/flags :$-"
echo "print the last argument of the previous command :$_"
echo "print the Internal Field Separator :$IFS"
echo "print the random integer between 0 and 32767 :$RANDOM"
echo "print the current line number in the script :$LINENO" 
