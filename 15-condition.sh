#!/bin/bash

Hour=$(date +"%H")

if [ "$Hour" -lt 12 ]; then
 echo "Good Morning Mansoor khan"
elif [ "$Hour" -lt 18 ]; then
 echo "Good Afternoon Mansoor khan"
else
 echo "Good Evening Mansoor khan"
fi



today=$(date +"%A")

if [ "$today" == "Monday" ]; then
    echo "Today is Monday"
elif [ "$today" == "Tuesday" ]; then
    echo "Today is Tuesday"
elif [ "$today" == "Wednesday" ]; then
    echo "Today is Wednesday"
elif [ "$today" == "Thursday" ]; then
    echo "Today is Thursday"
elif [ "$today" == "Friday" ]; then
    echo "Today is Friday"
elif [ "$today" == "Saturday" ]; then
    echo "Today is Saturday"
else
    echo "Today is Sunday"
fi
