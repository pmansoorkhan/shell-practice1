

#!/bin/bash

user_id=$(id -u)

 if [ "$user_id" -ne 0 ]; then
    echo "Please run this script as root user"
    exit 1
fi

   echo "Installing Nginx web server"
 dnf install nginx -y 

if [ $? -ne 0 ]; then
    echo "Nginx installation failed"
    exit 1
else
  echo "Nginx installed successfully"
     
fi




 echo "Installing Mysql database server"
dnf install mysql-server -y

if [ $? -ne 0 ]; then
    echo "Mysql installation is failed"
    exit 1
else
     echo "mysql installed  successfully"
fi

echo "Installing Docker"
dnf install docker -y

if [ $? -ne 0 ]; then
    echo "Docker installation is failed"
    exit 1
else 
    echo "Docker installed succesfully"
fi 
