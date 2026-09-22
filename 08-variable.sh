#!/bin/bash

Timestamp=$(date)
echo "current date and time is: $Timestamp"


Starttime=$(date +%s)
sleep 15

endtime=$(date +%s)

echo "total timetaken: $((endtime - Starttime)) seconds"


log3=$(cat /etc/passwd  | cut -d ":" -f1,3)
echo "$log3"
