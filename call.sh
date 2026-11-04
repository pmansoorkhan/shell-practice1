
 #!/bin/bash

# G="\e[32m"
# R="\e[31m"
# B="\e[34m"
# N="\e[0m"
# Y="\e[33m"

#  ./call2.sh 

# user_id=$(id -u)

#  if [ "$user_id" -ne 0 ]; then
#     echo -e " ${R} Please run this script as root user ${N}"
#     exit 1  
# fi

#     echo -e " ${B} Installing  $package web server ${N}"

#   dnf install $package -y

# if [ $? -eq 0 ]; then
#   echo -e  " ${G} $package installed successfully ${N}"
#    systemctl enable $package
#    systemctl start $package
#    echo -e " ${G} $package service started successfully ${N}"

# else
#     echo -e  " ${R} $package installation failed ${N} "
#     exit 1
# fi


echo "Main script is started successfully"

source ./calls.sh 

echo "Main script is executed successfully"
echo " PID1 of the current script is :: $$"

dnf install $package  -y

echo "$package installation is completed successfully"
