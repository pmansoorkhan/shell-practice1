#!/bin/bash
G="\e[32m"
R="\e[31m"
B="\e[34m"
N="\e[0m"

Count=1

until [ "$Count" -eq 100 ]; 
do 
 echo -e  "${G} NUmber count is :: ${N}:: ${B} $Count ${N} " 
 Count=$((Count + 1))
 
done
