#!/bin/bash
LOG_FILE="/var/log/disk_usage.log"
THRESHOLD=5
df -P | awk 'NR > 1 {gsub(/%/, "", $5); print $5, $6}'| while read  -r usage mount
do
    usage="${usage%\%}"
    if [ "$usage" -ge "$THRESHOLD" ]; then 
    echo -e  "$(date '+%y-%m-%d %H:%M:%S'): Warning - '$mount' utilization is ${usage}%" | tee -a "$LOG_FILE"
    fi 
done
