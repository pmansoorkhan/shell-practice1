#!/bin/bash 

COUNT=1

if [ "$COUNT" -eq  50 ]; then 
    echo "while Loop completed successfully"
    echo "Total number of iterations: $COUNT"
    
else
    echo "while Loop is not completed yet"

        while [ "$COUNT" -le 50 ]; 
        do 
            echo "Number is: $COUNT"
            COUNT=$((COUNT + 1 ))
        done 

fi
 

