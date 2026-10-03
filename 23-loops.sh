#!/bin/bash

USER_ID=$(id -u)
if [ "$USER_ID" -ne 0 ]; then
    echo "please run the script as root user"
    exit 1
fi

LOG_FOLDER="/var/log/shell-script1"
LOG_FILE="$LOG_FOLDER/$0.log"

mkdir -p $LOG_FOLDER

VALIDATE(){
  
if [ $1 -ne 0 ]; then
    echo "$2 installation  is failed" | tee-a $LOG_FILE
    exit 1
else
   echo "$2 installation is successful" | tee -a $LOG_FILE
fi

}

# for package in nginx mysql-server docker  # sudo sh 23-loops.sh
# do 
#      echo "Installing $package"
#  dnf install $package -y &>> $LOG_FILE
#  VALIDATE $? "$package"
#  done

for package in $@      # sudo sh 23-loops.sh nginx mysql-server docker
do 
 echo "Installing $package"
 dnf install $package -y &>> $LOG_FILE
 VALIDATE $? "$package installation"
 done

