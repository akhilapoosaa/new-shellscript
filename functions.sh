#!/bin/bash

#using functions for repeated tasks

ID=$(id -u)

#function to validate the user id, validate is a function name

VALIDATE(){
    if [ $? -ne 0 ]
    then 
        echo "not installed"
        exit 1
    else
        echo "installed successfully"
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

VALIDATE  #you are calling the function here to validate the installation mentioned above on validate function    

yum install git -y

VALIDATE