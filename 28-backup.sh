#!/bin/bash

USER_ID=$(id -u)
LOG_FOLDER="/var/log/shell-practice1"
SCRIPT_NAME=$(basename "$0")
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"  #/var/log/shell-practice1/backup.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
B="\e[34m"
SOURCE_DIR="$1"
DEST_DIR="$2"
Number_of_days="${3:-14}"
mkdir -p "$LOG_FOLDER"

if [ "$USER_ID" -ne 0 ]; then
    echo -e "${R} Please run the script as root user ${N}"
    exit 1
fi

USAGE(){
    echo -e "${R} Usage:: sudo  $0 <SOURCE_DIR> <DEST_DIR> <Number_of_days>[default::14 days] ${N}"   | tee -a "$LOG_FILE"
    echo "Default: 14 days"
    exit 1
}

log(){
   echo -e "$(date "+%y-%m-%d %H:%M:%S") | ${B} $1 ${N}" | tee -a "$LOG_FILE"
}

if [ "$#" -lt 2 ]; then
    USAGE
fi

if [ ! -d "$SOURCE_DIR" ]; then
 echo -e "${R} Source directory does not exist: "$SOURCE_DIR" ${N}" | tee -a "$LOG_FILE"
 exit 1
fi

if [ ! -d "$DEST_DIR" ]; then
 echo -e "${R} Destination directory does not exist: "$DEST_DIR" ${N}"  | tee -a "$LOG_FILE"
 exit 1
fi

#find the files
Files=$( find "$SOURCE_DIR" -name "*.log" -type f -mtime "+$Number_of_days" )  
echo "$Files" | tee -a "$LOG_FILE"


log "Backup started for files older than $Number_of_days days"
log "Source directory: $SOURCE_DIR"
log "Destination directory: $DEST_DIR"
log "Days:$Number_of_days days"    

if [ -z "$Files" ]; then 
    log "${B}No files to acrhive in "$SOURCE_DIR" ${N}....${Y} Skipping backup process ${N}" | tee -a "$LOG_FILE"

else
  # app-logs-$timestamp.tar.gz
    log "Files found to be archived: $Files"
    TIME_STAMP=$(date "+%F_%H-%M-%S")
    ZIP_FILE="$DEST_DIR/app-logs-$TIME_STAMP.tar.gz"
     echo -e "${G} Archieved files: $ZIP_FILE ${N}"
    #tar -zcvf "$ZIP_FILE" $Files
    (find "$SOURCE_DIR" -name "*.log" -type f -mtime "+$Number_of_days") | tar -zcvf "$ZIP_FILE" 


    if [ tar -tzf "$ZIP_FILE" ]; then 
        log "Archieval is......${G} Success ${N}"  | tee -a "$LOG_FILE"
         while IFS= read -r line; do
            echo "Deleting file :: $line"
            rm -- "$line"
            echo -e "${R} Deleted file :: $line ${N}"
        done <<< "$Files"

    else 
        log "Archieval is..... ${R} Failure ${N}"  | tee -a "$LOG_FILE"
        exit 1
    fi 
fi


#command to unzip tar files in project from DesT
#tar -xzvf app-logs-2026-11-09_13-15-18.tar.gz