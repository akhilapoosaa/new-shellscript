#!/bin/bash

#passings args in functions

ID=(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]    # $1 is the exit status 
    then
        echo "ERROR:: $2 is failed"     # $2 is the message 
        exit 1
    else
        echo "$2 is successful"
    fi
}

if [ $ID -ne 0 ]
then 
    echo "error you are not the root user, please switch to root user"
    exit 1
else
    echo "you are the root user"
fi

yum install mysql -y

validate $?  "installing mysql" #passing the exit status of the previous command to the function

yum install git -y

validate $?  "installing git" 