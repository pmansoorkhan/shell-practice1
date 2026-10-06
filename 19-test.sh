#!/bin/bash

user_id=$(id -u)

 if [ "$user_id" -ne 0 ]; then
    echo "Please run this script as root user"
    exit 1
fi


VALIDATE(){
if [ $1 -ne 0 ]; then
  echo "$2 installation failed"
  exit 1
else
  echo "$2 installed successfully"
fi
}

echo "Installing Nginx web server"
dnf install nginx -y 
VALIDATE $? "Nginx"

echo "Installing mysql database server"
dnf install mysql-server -y 
VALIDATE $? "mysql"

echo "Installing Docker"
dnf install docker -y 
VALIDATE $? "Docker"





