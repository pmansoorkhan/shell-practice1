#!/bin/bash

Timestamp=$(date)
echo "current date and time is: $Timestamp"


log3=$(cat /etc/passwd  | cut -d ":" -f1)
echo "$log3"