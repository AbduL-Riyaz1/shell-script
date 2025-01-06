#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: you must have sudo access to execute this script"
    exit 122
fi

dnf install mysqll -y

if [ $? -ne 0 ]
then
    echo "installing mysql.....FAILURE"
    exit 1
else
    echo "installing mysql.....SUCCESS"
fi

dnf install git -y

if [ $? -ne 0 ]
then
    echo "installing git.....FAILURE"
    exit 1
else
    echo "installing git.....SUCCESS"
fi