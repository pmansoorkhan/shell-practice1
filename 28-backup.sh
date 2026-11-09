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
SOURCE_DIR="$1"
DEST_DIR="$2"
Number_of_days="${3:-14}"

if [ "$USER_ID" -ne 0 ]; then
    echo -e "${R} Please run the script as root user ${N}"
fi

mkdir -p "$LOG_FOLDER"

USAGE(){
    echo -e "${R} Usage:: sudo  $0 <SOURCE_DIR> <DEST_DIR> <Number_of_days>[default::14 days] ${N}"
    exit 1
}

if [ "$#" -lt 2 ]; then
    USAGE
fi

if [ ! -d "$SOURCE_DIR" ]; then
 echo -e "${R} Source directory does not exist: $SOURCE_DIR ${N}"
 exit 1
fi

if [ ! -d "$DEST_DIR" ]; then
 echo -e "${R} Destination directory does not exist: $DEST_DIR ${N}"
 exit 1
fi
