#!/bin/bash

USER_ID=$(id -u)
if [ "$USER_ID" -ne 0 ]; then
    echo "Please run the script as root user"
    exit 1
fi

 LOG_FOLDER="/var/log/shell-script1"
 LOG_FILE="$LOG_FOLDER/$0.log"
  
  mkdir -p "$LOG_FOLDER"

VALIDATE(){
 if [$1 -ne 0 ]; then
    echo "$2 installation is failed" | tee -a $LOG_FILE
    exit 1
else 
  echo "$2 installation is succesfull" | tee -a $LOG_FILE
fi  
  }

for package in $@
do 
   dnf list installed $package &>> $LOG_FILE
      if [ $? -ne 0 ]; then
            echo "$package is not installed, installing it now" | tee -a $LOG_FILE
            dnf install $package -y &>> $LOG_FILE
            VALIDATE $? "$package installation"
      else
            echo "$package is already installed, skipping installation" | tee -a $LOG_FILE
      fi
done