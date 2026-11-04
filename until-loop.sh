#!/bin/bash

Count=1

until [ "$Count" -gt 25 ]; 
do 
 echo "NUmber count is :: "$Count"" 
 Count=$((Count + 1))
 
done
