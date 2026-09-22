#!/bin/bash

Timestamp=$(date)
echo "current date and time is: $Timestamp"


Starttime=$(date +%s)
sleep 12
Endtime=$(date +%s)
Totaltime=$(($Endtime -$Starttime))
echo "Total time taken: $Totaltime seconds"

echo "script starttime:$Starttime seconds"
echo "script endtime: $Endtime seconds"

log3=$(cat /etc/passwd  | cut -d ":" -f1,3)
echo "$log3"
