#!/bin/bash

Timestamp=$(date)
echo "current date and time is: $Timestamp"


log3=$(cat /etc/passwd  | cut -d ":" -f1, f2, f3, f4, f5, f6, f7)
echo "$log3"