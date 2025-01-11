#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: you must have sudo access to execute the script"
fi

dnf install mysqll -y
