
#!/bin/bash

G="\e[32m"
R="\e[31m"
B="\e[34m"
N="\e[0m"
Y="\e[33m"


user_id=$(id -u)

 if [ "$user_id" -ne 0 ]; then
    echo -e " ${R} Please run this script as root user ${N}"
    exit 1
fi

    echo -e " ${B} Installing Nginx web server ${N}"

  dnf install nginx -y 
if [ $? -eq 0 ]; then
  echo -e  " ${G} Nginx installed successfully ${N}"
   systemctl enable nginx
   systemctl start nginx
   echo -e " ${G} Nginx service started successfully ${N}"

else
    echo -e  " ${R} Nginx installation failed ${N} "
    exit 1
fi



# user=$(id -u)
# if [ "$user" -ne 0 ]; then 
#     echo "Please run the script as root user"
#     exit 1
# fi

# my_packages=("nginx" "mysql" "docker" "python3")
# for package in "${my_packages[@]}"; do
#     echo " we are Installing $package..."
#     dnf install "$package" -y
#     if [ "$?" -eq 0 ]; then
#         echo "$package installed successsfully"
#     else
#         echo "Failed to install $package"
#     fi
# done

# ******************************************
# # if ["$user" -ne 0 ]; then
# # echo "you are running as non root user"
# # exit 0
# # fi
# # my_packages=("nginx" "mysql" "docker" "python3")
# # for package in "${my_packages[@]}"; do
# #     echo " we are uninstalling $package..."
# #     dnf remove "$package" -y
# #     if [ "$?" -eq 0 ]; then
# #         echo "$package uninstalled successsfully"
# #     else
# #         echo "Failed to uninstall $package"
# #     fi
# # done
