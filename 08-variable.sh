#!/bin/bash

Timestamp=$(date)
echo "current date and time is: $Timestamp"


log3=$(cat /etc/passwd  | cut -d ":" -f1,3,5,6,7)
echo "$log3"