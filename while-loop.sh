#!/bin/bash 

COUNT=1
while [ "$COUNT" -le 50 ]; then 
echo "Number is: $COUNT"
COUNT=$((COUNT + 1 ))
done 

if [ "$COUNT" -eq 50 ]; then 
 echo "while Loop completed successfully"
 echo "Total number of iterations: $COUNT"
fi
