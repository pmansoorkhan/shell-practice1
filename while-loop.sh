#!/bin/bash 

COUNT=$1

if [ "$COUNT" -ge  50 ]; then 
    echo "while Loop completed successfully"
    echo "Total number of iterations:: $COUNT"
    echo "PID1 of the current process:: $$"


else
    echo "while Loop is not completed yet"

        while [ "$COUNT" -le 50 ]; 
        do 
            echo "Number is:: $COUNT"
            COUNT=$((COUNT + 1 ))
            
        done 
    echo "Total numbers::"$COUNT"" 

    echo "PID2 of the current process:: $$ "
fi
 

