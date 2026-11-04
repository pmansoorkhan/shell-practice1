#!/bin/bash 
G="\e[32m"
R="\e[31m"
B="\e[34m"
N="\e[0m"
Y="\e[33m"

COUNT=$1

if [ "$COUNT" -ge  50 ]; then 
    echo -e " ${G} while Loop completed successfully ${N} "
    echo  -e " ${Y} Total number of iterations:: $COUNT ${N} "
    echo  -e " ${B} PID1 of the current process:: $$ ${N} "


else
    echo -e "${R} while Loop is not completed yet ${N} "

        while [ "$COUNT" -le 50 ]; 
        do 
            echo "Number is:: $COUNT"
            COUNT=$((COUNT + 1 ))
            
        done 
    echo -e " ${Y} Total numbers:: $COUNT ${N} "
    echo -e "${B} PID2 of the current process:: $$ ${N}"

fi
