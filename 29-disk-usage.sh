#!/bin/bash
LOG_FILE="/var/log/disk_usage.log"
THRESHOLD=30

df -P | awk 'NR > 1 {print $5}'| while read usage mount
do
    usage="${usage%\%}"
    if ["$usage" -le "$THRESHOLD"]; then 
        echo "$(date +%F): Warning - $mount usage is ${usage}%" &>> "$LOG_FILE"
    fi 
done 

