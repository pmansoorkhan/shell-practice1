#!/bin/bash
LOG_FILE="/var/log/disk_usage.log"
THRESHOLD=30

df -P | grep -v Filesystem |awk 'NR > 1 {print $5,$6}'| while read usage mount
do
    usage="${usage%\%}"
if [ "$usage" -le "$THRESHOLD"]
    echo "$(date +%F): Warning - $mount usage is ${usage}%" &>> "$LOG_FILE"
fi 
done 
