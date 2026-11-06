#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
B="\e[34m"

LOG_DIR="/home/ec2-user/app-logs"
SCRIPT_NAME=$(basename "$0")
LOG_FILE="$LOG_DIR/$SCRIPT_NAME.log"

if [  ! -d "$LOG_DIR" ]; then
     echo -e "${R} $LOG_DIR  Directory does not exist ${N}"
     exit 1
fi
