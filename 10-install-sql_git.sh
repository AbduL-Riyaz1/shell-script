#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR::You Must Have Sudo Acess To Execute This Script"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
    echo "Installing mysql.....FAILED"
    exit 1
else
    echo "Installing mysql.....SUCCESS"
fi

dnf install git -y

if [ $? -ne 0 ]
then
    echo "Installing git.....FAILED"
    exit 1
else
    echo "Installing git.....SUCCESS"
fi
