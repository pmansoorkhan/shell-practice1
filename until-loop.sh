#!/bin/bash

Count=1

until [ "$Count" -eq 100 ]; 
do 
 echo "NUmber count is :: "$Count"" 
 Count=$((Count + 1))
 
done
