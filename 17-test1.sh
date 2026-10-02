
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
    exit 1
fi



user=$(id -u)
if [ "$user" -ne 0 ]; then 
    echo "Please run the script as root user"
    exit 1
fi

my_packages=("nginx" "mysql" "docker" "python3")
for package in "${my_packages[@]}"; do
    echo " we are Installing $package..."
    dnf install "$package" -y
    if [ "$?" -eq 0 ]; then
        echo "$package installed successsfully"
    else
        echo "Failed to install $package"
    fi
done

******************************************
# if ["$user" -ne 0 ]; then
# echo "you are running as non root user"
# exit 0
# fi
# my_packages=("nginx" "mysql" "docker" "python3")
# for package in "${my_packages[@]}"; do
#     echo " we are uninstalling $package..."
#     dnf remove "$package" -y
#     if [ "$?" -eq 0 ]; then
#         echo "$package uninstalled successsfully"
#     else
#         echo "Failed to uninstall $package"
#     fi
# done
