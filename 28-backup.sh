#!/bin/bash

USER_ID=$(id -u)
LOG_FOLDER="/var/log/shell-practice1"
SCRIPT_NAME=$(basename "$0")
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
B="\e[34m"

if [ "$USER_ID" -ne 0 ]; then
    echo -e "${R} Please run the script as root user ${N}"
fi

mkdir -p "$LOG_FOLDER"

USAGE(){
    echo -e "${R} Usage:: sudo  $0 <source_dir> <dest_dir> <number_of_days>[default::14] ${N}"
    exit 1
}

if [ "$#" -lt 2 ]; then
    USAGE
fi



