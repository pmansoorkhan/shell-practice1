#!/bin/bash

Hour=$(date +"%H")

if [ "$Hour" -lt 12 ]; then
 echo "Good Morning Mansoor khan"
elif [ "$Hour" -lt 18 ]; then
 echo "Good Afternoon Mansoor khan"
else
 echo "Good Evening Mansoor khan"
fi
