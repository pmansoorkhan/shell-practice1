#!/bin/bash

user_id=$(id -u)

 if [ "$user_id" -ne 0 ]; then
    echo "Please run this script as root user"
    exit 1
fi

   echo "Installing Nginx web server"
 dnf install nginx -y 

if [ $? -eq 0 ]; then
  echo "Nginx installed successfully"
   systemctl enable nginx
   systemctl start nginx

   echo "Nginx service started successfully"
else
    echo "Nginx installation failed"
fi
