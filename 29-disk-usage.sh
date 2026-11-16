#!/bin/bash
LOG_FILE="/var/log/disk_usage.log"
THRESHOLD=10

df -P | awk 'NR > 1 {print $5, $6}'| while read  -r usage mount
do
    usage="${usage%\%}"
    if [ "$usage" -ge "$THRESHOLD" ]; then 
        echo "$(date +%F): Warning - $mount usage is ${usage}%" &>> "$LOG_FILE"
    fi 
done 

