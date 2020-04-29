#!/bin/bash

#This script displays the system information
# -Hostname information 

echo -e "\e[31;43m ***** HOSTNAME INFORMATION *****\e[0m"
hostnamectl

echo ""

# -File system disk space usage:
echo -e "\e[31;43m ***** FILE SYSTEM DISK SPACE USAGE *****\e[0m"
df -h
echo ""
# -System uptime and load

echo -e "\e[31;43m ***** CURRENTLY LOGGED-IN USERS *****\e[0m"
who 
echo ""

# -Top 5 processes as far as memory usage is concerned
echo -e "\e[31;43m ***** TOP 5 MEMORY-CONSUMING PROCESSES *****\e[0m" 


ps -eo %mem,%cpu,comm --sort=-%mem | head -n 6
echo ""
echo -e "\e[1;32mDone.\e[0m"
