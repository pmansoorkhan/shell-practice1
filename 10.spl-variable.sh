#!/bin/bash 

**********************
Topic: shell variables and its usage
Owner: Mansoor Khan
Date: 22nd_Sept_2026
**********************  

echo "print the  name of the script:$0"     # gives the name of the script
echo "print the 1st argument:$1"            # gives the 1st argument passed to the script
echo "print the 2nd argument :$2"           # gives the 2nd argument passed to the script
echo "print the 3rd argument :$3"           # gives the 3rd argument passed to the script
echo "print the total number of arguments :$#" # gives the total number of arguments passed to the script
echo "print all the arguments :$@"          # gives all the arguments passed to the script, treating each argument separately
echo "print all the arguments as one :$*"   # gives all the arguments passed to the script as a single string when quoted
sleep 10 
echo "print the exit status of the previous command :$?"     # gives the exit status of the previous command (0 usually means success)
echo "print the PID of the current shell/script :$$"         # gives the PID of the current shell/script
echo "print the PID of the current Bash process :$BASHPID"   # gives the PID of the current Bash process
echo "print the who is running the script:$USER"             # gives the user who is running the script
echo "print the home directory of the user:$HOME"            # gives the home directory of the user
sleep 5
echo "print the PID of the most recently executed background process :$!"    # gives the PID of the most recently executed background process
echo "print the current shell options/flags :$-"                             # gives the current shell options/flags
echo "print the last argument of the previous command :$_"                   # gives the last argument of the previous command
echo "print the Internal Field Separator :$IFS"                              # gives the Internal Field Separator
echo "print the random integer between 0 and 32767 :$RANDOM"                    # gives a random integer between 0 and 32767
echo "print the current line number in the script :$LINENO"                  # gives the current line number in the script
