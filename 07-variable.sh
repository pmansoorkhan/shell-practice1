#!/bin/bash

hostname=$(hostname)
echo "$hostname"


current_date=$(date)
echo "Current date: $current_date"


disk_usage=$(df -h / | tail -5)
echo "$disk_usage"

  logs=$(/etc/user)
  echo "$logs"
