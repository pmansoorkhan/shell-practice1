#!/bin/bash

user_id=$(id -u)

LOG_FOLDER="/var/log/shell-script1"
LOG_FILE="/var/log/shell-script1/$0.log"   # $0 is the script name 


 if [ "$user_id" -ne 0 ]; then
    echo "Please run this script as root user"
    exit 1
fi

mkdir -p $LOG_FOLDER


VALIDATE(){
if [ $1 -ne 0 ]; then
  echo "$2 installation failed"
  exit 1
else
  echo "$2 installed successfully"
fi
}

echo "Installing Nginx web server"
dnf install nginx -y  &>> $LOG_FILE  # & is used to redirect both stdout and stderr to the log file.
VALIDATE $? "Nginx"

echo "Installing mysql database server"
dnf install mysql-server -y  &>> $LOG_FILE # >> is used to redirect stdout to the log file and append it to the existing content of the log file.
VALIDATE $? "mysql"

echo "Installing Docker"
dnf install docker -y  &>> $LOG_FILE
VALIDATE $? "Docker"
