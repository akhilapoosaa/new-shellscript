#!/bin/bash

file=/etc/passwd

R="\e[31m"
G="\e[32m"  
Y="\e[33m"
N="\e[0m"   

if [ ! -f $file ]
then
    echo -e "$R ERROR:: $file file does not exist $N"
    exit 1
else
    echo -e "$G SUCCESS:: $file file exists $N"
fi

while IFS=":" read -r username uid gid fullname homedir shell
do
    echo "Username: $username"
    echo "UID: $uid"
    echo "GID: $gid"
    echo "Full Name: $fullname"
    echo "Home Directory: $homedir"
    echo "Shell: $shell"
done < $file
# IFS internal filed separator is used to set the delimiter for the read command
# -r option is used to read the line without interpreting backslashes
# done < $file is used to read the file line by line