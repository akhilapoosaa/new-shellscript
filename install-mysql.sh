#!/bin/bash

#installing mysql

ID=$(id -u)  #get the user id by using the id command

if [ $ID -ne 0 ] #if the user id is not equal to 0 then the user is not a root user
then
    echo "ERROR:: you are not the root user, please switch to root user"
else
    echo "you are the root user"    
fi

yum install mysql-server -y  #installing mysql server