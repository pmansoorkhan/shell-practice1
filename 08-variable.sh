#!/bin/bash

Timestamp=$(date)
echo "current date and time is: $Timestamp"


log3=$(cat /etc | head -10)
 echo "$log3"