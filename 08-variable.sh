#!/bin/bash

Timestamp=$(date)
echo "current date and time is: $Timestamp"


Starttime=$(date +%s)
sleep 15

endtime=$(date +%s)

total_time= $(endtime - starttime)
echo "total timetaken:$(total_time) seconds"


log3=$(cat /etc/passwd  | cut -d ":" -f1,3)
echo "$log3"
