#!/bin/bash
 
#adding logs to the script

echo "script name is $0"    # $0 is the script name

ID=(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]   # $? is $1 arg that is the exit status 
    then
        echo "ERROR:: $2 is failed"  #after validate at the bottom installing mysql/git message is $2 arg   
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

VALIDATE $?  "installing mysql" #passing the exit status of the previous command to the function

yum install git -y

VALIDATE $?  "installing git" 