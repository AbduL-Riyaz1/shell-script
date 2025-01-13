#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2....$R FAILURE $N"
        exit 1
    else
        echo -e "$2....$G SUCCESS $N"
    fi
}

if [ $? -ne 0 ]
then 
    echo "You must have sudo access to execute this script"
    exit 1
fi

dnf list instaled mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "INSTALLING MYSQL"
else
    echo -e "MYSQL is already....$Y INSTALLED $N"
fi

dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "INSTALLING GIT"
else
    echo -e "git is already....$Y INSTALLED $N"
fi