#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR::You Must Have Sudo Acess To Execute This Script"
fi

dnf install mysql -y

dnf install git -y