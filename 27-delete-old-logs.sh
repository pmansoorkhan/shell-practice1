#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
B="\e[34m"
DAY=$1
LOG_DIR="/home/ec2-user/app-logs"
SCRIPT_NAME=$(basename "$0")
LOG_FILE="$LOG_DIR/$SCRIPT_NAME.log"

if [  ! -d "$LOG_DIR" ]; then
     echo -e "${R} $LOG_DIR  Directory does not exist ${N}"
     exit 1
fi



Files_to_delete=$(find "$LOG_DIR" -type f -name "*.log" -mtime +"$DAY")

if [ -z "$Files_to_delete" ]; then
    echo -e "${G} No old log files to delete ${N}"
    exit 1
else 
    echo -e "${Y} Found the following log files::$Files_to_delete ${N} "
fi 


while IFS= read -r line; do
    echo "Deleting file :: $line"
     rm -r "$line"
     echo -e "${G} Deleted file :: $line ${N}"
done <<< "$Files_to_delete"




# total 0
# -rw-r--r--  1 ec2-user ec2-user   0 Oct  1 00:00 user.log
# -rw-r--r--  1 ec2-user ec2-user   0 Oct  1 00:00 shipping.log
# -rw-r--r--  1 ec2-user ec2-user   0 Oct  1 00:00 catalogue.log
# -rw-r--r--  1 ec2-user ec2-user   0 Oct  1 00:00 cart.log
# -rw-r--r--  1 ec2-user ec2-user   0 Nov  1 00:00 redis.log
# -rw-r--r--  1 ec2-user ec2-user   0 Nov  1 00:00 rabbitmq.log
# -rw-r--r--  1 ec2-user ec2-user   0 Nov  1 00:00 mysql.log
# -rw-r--r--  1 ec2-user ec2-user   0 Nov  1 00:00 mongodb.log
# drwxr-xr-x  2 ec2-user ec2-user 152 Nov  7 05:49 .
# drwx------. 5 ec2-user ec2-user 134 Nov  7 07:23 ..




# while IFS= read -r line; do
#     echo "$line"
# done < "15-condition.sh"



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