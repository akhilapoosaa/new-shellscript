#!/bin/bash

#delete old log files
# This script is used to delete old log files from the /tmp directory.
# It deletes all log files that are older than 7 days.

SOURCE_DIR=/tmp/shellscript-logs

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#! is used to check if the directory does not exist
# -d option is used to check if the directory exists
if [ ! -d $SOURCE_DIR ] 
then
    echo -e "$R ERROR:: $SOURCE_DIR directory does not exist $N"
    exit 1
else
    echo -e "$G SUCCESS:: $SOURCE_DIR directory exists $N"
fi

FILES_TO_DELETE=$(find $SOURCE_DIR -type f -name "*.log" -mtime +14)
# -type f option is used to find files
# -name option is used to find files with the name *.log
# -mtime option is used to find files that are older than 7 days

while read -r line
do 
    echo "Deleting file: $line"
done <<< "$FILES_TO_DELETE" 
# <<< is used to read the output of the command into a variable
# while loop is used to iterate over the files to delete
# read -r option is used to read the line without interpreting backslashes