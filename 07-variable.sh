#!/bin/bash

hostname=$(hostname)
echo "$hostname"


current_date=$(date)
echo "Current date: $current_date"


disk_usage=$(df -h / | tail -5)
echo "$disk_usage"

logs=$(tail -10 /var/log/messages)
echo "$logs"

logs1=$(head -5 /etc/passwd)
echo "$logs1"