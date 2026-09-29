#!/bin/bash

dnf install nginx -y 

user_id=$?

 if [ "user_id" -eq 0 ]; then
   echo "Nginx installed successfully"
else
    echo "Nginx installation failed"
fi

