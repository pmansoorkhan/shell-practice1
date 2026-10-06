#!/bin/bash

for i in {1..100}
do
echo  "$i"
done 


for package in nginx mysql-server docker
do 
    echo "Installing $package"
dnf install $package -y  & >> $LOG_FILE
VALIDATE $? "$package"
done

