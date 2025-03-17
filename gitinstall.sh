#!/bin/bash

#installing git

ID=$(id -u)

if [ $ID -ne 0 ]
then 
    echo "error you are not the root user, please switch to root user"
    exit 1
else
    echo "you are the root user"
fi

yum install git -y 

if [ $? -ne 0 ]
then 
    echo "error git is not installed"
    exit 1
else
    echo "git is installed successfully"
fi