#!/bin/bash

Timestamp=$(date)
echo "current date and time is: $Timestamp"


Starttime=$(date +%s)
sleep 5
endtime=$(date +%s)

totaltime=$(($endtime - $starttime))
echo"total timetaken: $totaltime seconds"


log3=$(cat /etc/passwd  | cut -d ":" -f1,3)
echo "$log3"
