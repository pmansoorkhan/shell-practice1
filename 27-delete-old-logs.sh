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

Files_to_delete=$(find "$LOG_DIR" -type f -name "*.log" -mtime +14)


while IFS= read -r line; do
    echo "$line"
done <<< "26-colors.sh"



# if [ -z "$Files_to_delete" ]; then
#     echo -e "${G} No old log files to delete ${N}"
# else
#     echo -e "${Y} Found the following old log files: ${N}"
#     echo "$Files_to_delete"
#     echo -e "${R} Deleting old log files... ${N}"
# #     rm $Files_to_delete
# #     echo -e "${G} Old log files deleted successfully ${N}"
# fi


# while IFS= read -r line; do
#     echo "$line"
# done < "$file_path"