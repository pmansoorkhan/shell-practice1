#!/bin/bash

USER_ID=$(id -u)

LOG_FOLDER="/var/log/shell-script1"
SCRIPT_NAME=$(basename "$0")
LOG_FILE=$LOG_FOLDER/$SCRIPT_NAME.log
# R="\[31m"
# G="\[32m"
# Y="\[33m"
# N="\[0m"
# B="\[34m"

if [ "$USER_ID" -ne 0 ]; then
    echo -e "\[31mPlease run the script as root user\[0m"
    exit 1
fi

mkdir -p "$LOG_FOLDER"

VALUE(){
 if [ $1 -ne 0 ]; then 
   echo -e "\[31m$2 installation is failed\[0m" | tee -a $LOG_FILE
   exit 1
else
    echo -e "\[32m$2 installation is successful\[0m" | tee -a $LOG_FILE
fi
}

for package in "$@"
do 
    dnf list installed $package 
    if [ $? -ne 0 ]; then
        echo -e "\[34m$package is not installed, installing it now\[0m" | tee -a $LOG_FILE
        dnf install $package -y &>> $LOG_FILE
        VALUE "$?" "$package"
    else
        echo -e "\[34m$package is already installed\[0m, \[33mskipping installation\[0m" | tee -a $LOG_FILE
    fi
done





# #!/bin/bash

# USER_ID=$(id -u)

# LOG_FOLDER="/var/log/shell-script1"
# SCRIPT_NAME=$(basename "$0")
# LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

# if [ "$USER_ID" -ne 0 ]; then
#     echo -e "\e[31mPlease run the script as root user\e[0m"
#     exit 1
# fi

# mkdir -p "$LOG_FOLDER"

# VALUE() {
#     if [ "$1" -ne 0 ]; then
#         echo -e "\e[31m$2 installation failed\e[0m" | tee -a "$LOG_FILE"
#         exit 1
#     else
#         echo -e "\e[32m$2 installation is successful\e[0m" | tee -a "$LOG_FILE"
#     fi
# }

# for package in "$@"
# do
#     dnf list installed "$package" &>> "$LOG_FILE"

#     if [ $? -ne 0 ]; then

#         echo -e "\e[34m$package is not installed, installing it now\e[0m" | tee -a "$LOG_FILE"

#         dnf install "$package" -y &>> "$LOG_FILE"

#         VALUE "$?" "$package"

#     else

#         echo -e "\e[34m$package is already installed\e[0m, \e[33mskipping installation\e[0m" | tee -a "$LOG_FILE"

#     fi
# done