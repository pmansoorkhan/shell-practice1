#!/bin/bash
{
echo "To:pmansoorkhan04@gmail.com"
echo "Subject: DISK_UTILIZATION"
echo "Content-Type: text/html"
echo ""
echo "MESSAGE"
} | msmtp "pmansoorkhan04@gmail.com"




# {
# echo "To: $TO_ADDRESS"
# echo "Subject: $SUBJECT"
# echo "Content-Type: text/html"
# echo ""
# echo "$EMAIL_BODY"
# } | msmtp "$TO_ADDRESS"