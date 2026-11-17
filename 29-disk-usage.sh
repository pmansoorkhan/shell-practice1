# #!/bin/bash
# LOG_FILE="/var/log/disk_usage.log"
# THRESHOLD=5
# df -P | awk 'NR > 1 {gsub(/%/, "", $5); print $5, $6}'| while read  -r usage mount
# do
#     usage="${usage%\%}"
#     if [ "$usage" -ge "$THRESHOLD" ]; then 
#     echo -e  "$(date '+%y-%m-%d %H:%M:%S'): Warning - '$mount' utilization is ${usage}%" | tee -a "$LOG_FILE"
#     fi 
# done




#!/bin/bash
LOG_FILE="/var/log/disk.log"
USER_ID="$(id -u)"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"
MESSAGE=""

if [ "$USER_ID" -ne 0  ]; then
    echo -e "${R} Please run the script as root user ${N}"
    exit 1
fi

SERVER_IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
DISK_USAGE=$(df -hT | grep -v Filesystem)  
THRESHOLD=3

while IFS= read -r line 
do
    USAGE=$(echo "$line" | awk '{print $6}'| cut -d "%" -f1) 
    echo "$USAGE" | &>> "$LOG_FILE"

    PARTITION=$(echo "$line" | awk '{print $7}') 
    echo "$PARTITION" &>> "$LOG_FILE"

    if [ "$USAGE" -ge "$THRESHOLD" ] ; then
        MESSAGE+=" $(date '+%y-%m-%d %H:%M:%S'):: ${B} High disk usage on ${N} $PARTITION:${R}$USAGE% ${N}\n"  #high disk usage on :: /var 10      
    fi
done <<< "$DISK_USAGE"
    echo -e "$MESSAGE"
    echo -e " Server IP ::$SERVER_IP"



#df -hT | grep -v Filesystem | awk '{print $6}'| cut -d "%" -f1 ----> coomand to get disk utilization in number
#df -hT | grep -v Filesystem | awk '{print $7}' ---> coomand to get the directory of the filesystem