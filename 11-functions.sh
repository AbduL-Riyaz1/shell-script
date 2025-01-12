#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ] #assume $?--->$1,INSTALLING MYQL--->$2
    then
        echo "$2....FAILURE"
        exit 1
    else
        echo "$2....SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execuite this script"
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "INSTALLING MYSQL"
else
    echo "mysql is already....INSTALLED"
fi

dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "INSTALLING GIT"
else
    echo "git is already....INSTALLED"
fi