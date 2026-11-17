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

SERVER_IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
DISK_USAGE=$(df -hT | grep -v Filesystem)  
THRESHOLD=3

while IFS= read -r line 
do
    USAGE=$(echo "$line" | awk '{print $6}'| cut -d "%" -f1) 
    echo "$USAGE" | &>> "$LOG_FILE"

    PARTITION=$(echo "$line" | awk '{print $7}') 
    echo "$PARTITION" &>> "$LOG_FILE"

    if [ "$USAGE" -ge "$THRESHOLD" ] ; then
        #MESSAGE+=" $(date '+%y-%m-%d %H:%M:%S'):: ${B} High disk usage on ${N} $PARTITION:${R}$USAGE% ${N} \n"  ##--> this is used in shell to print line by line(screen output)      
        MESSAGE+=" $(date '+%y-%m-%d %H:%M:%S') Disk usage on $PARTITION:$USAGE%  <br>" ##---> this command is used in HTML to print line by line(mail)
    fi
done <<< "$DISK_USAGE"
    echo -e "$MESSAGE"
    echo -e "ServerIP :: "$SERVER_IP""


 sh mail.sh  "pmansoorkhan04@gmail.com" "High Disk Usage alert on $SERVER_IP" "$MESSAGE" "HIGH DISK_USAGE" "$SERVER_IP" "DevOps Team" 
 
#df -hT | grep -v Filesystem | awk '{print $6}'| cut -d "%" -f1 ----> coomand to get disk utilization in number
#df -hT | grep -v Filesystem | awk '{print $7}' ---> coomand to get the directory of the filesystem
#sh mail.sh "pmansoorkhan04@gmail.com"  "High Disk Usage alert on $SERVER_IP"  "$MESSAGE" "HIGH DISK_USAGE"  "$SERVER_IP" "DevOps Team"