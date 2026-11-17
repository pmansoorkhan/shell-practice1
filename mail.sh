#!/bin/bash
TO_ADDRESS=$1  
SUBJECT=$2
MESSAGE_BODY=$3
ALERT_TYPE=$4
SERVER_IP=$5
TO_TEAM=$6
NAME=$7

FINAL_MESSAGE_BODY=$(echo $MESSAGE_Body | sed -e "s/'/'\\\\''/g")

#FINAL_MESSAGE="$( sed -e "s/TO_TEAM/$6/g" -e "s/ALERT/$4/g" -e "s/SERVER-IP/$5/g"  "s/MESSAGE/$3/g"  template.html)"
FINAL_MESSAGE=$(sed \
    -e "s|TO_TEAM|$TO_TEAM|g" \
    -e "s|ALERT|$ALERT_TYPE|g" \
    -e "s|SERVER-IP|$SERVER_IP|g" \
    -e "s|NAME|$SERVER_NAME|g" \
    -e "s|MESSAGE|$MESSAGE_BODY|g" \
    template.html)

{
echo "To: $TO_ADDRESS"
echo "Subject: $SUBJECT"
echo "Content-Type: text/html"
echo ""
echo "$FINAL_MESSAGE"
} | msmtp "$TO_ADDRESS"


#sh mail.sh  "pmansoorkhan04@gmail.com" "High Disk Usage alert on $SERVER_IP" "$MESSAGE" "HIGH DISK_USAGE" "$SERVER_IP" "DevOps Team"