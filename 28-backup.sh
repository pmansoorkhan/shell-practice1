#!/bin/bash

USER_ID=$(id -u)
LOG_FOLDER="/var/log/shell-script1"
SCRIPT_NAME=$(basename "$0")
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
B="\e[34m"

if [ "$USER_ID" -ne 0 ]; then
    echo -e "${R}Please run the script as root user${N}"
    exit 1
fi

USAGE(){
    echo -e "${R} Usage:sudo <source_dir> <destination_dir> <number_of_days>[default is 14] ${N}"
    exit 1
}
 