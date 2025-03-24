#!/bin/bash

#using loops to install packages

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m" #reset the color or no color

TIMESTAMP=$(date '+%F-%H-%M-%S') #date command is used to get the current date and time and stores it in the variable TIMESTAMP
LOGFILE="/tmp/$0-$TIMESTAMP.log"  #stores the log file in the /tmp directory with the name of the script and the timestamp

echo "script started executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    if [ $1 -ne 0 ]  #if the exit status of the command is not 0, then the command has failed
    then 
        echo -e "$2 ... $R FAILED $N" #if the command has failed, then print the message as failed in red color
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N" #if the command has passed, then print the message as success in green color
    fi
}

if [ $ID -ne 0 ]
then 
    echo -e "$R ERROR:: please run the script with root access $N"
    exit 1
else
    echo -e "$G SUCCESS:: script is running with root access $N"
fi  #fi means reverse of if , indicating the end of if block

#we are checking all the arguments, here packages are args that are passed to the script
#for that we use command echo "All the arguments are: $@"  example: git postfix net-tools java etc
#instead use package varaible, loop assigns each arg to $package, git is the package name for the first argument

for package in $@ 
do 
    yum list installed $package &>> $LOGFILE #yum list installed is the command to check if the package is installed or not
    if [ $? -ne 0 ]   #if the exit status of the command is not 0, then the package is not installed
    then 
        yum install $package -y &>> $LOGFILE #install the package
        VALIDATE $? "installation of $package"
        #VALIDATE is a function that is taking args, first arg is the exit status of the command $?, second is the message to be displayed
        #we can pass number of args to the function, but we are passing only 2 args
    else
        echo -e "$package is already installed... $Y SKIPPIMG $N"
    fi 
done
