#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2....$R FAILURE $N"
        exit1
    else
        echo -e "$2....$G SUCCESS $N"
    fi
}

echo "Script is executeing at: $TIMESTAMP" &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then 
    echo "You must have sudo access to execute this script"
    exit 1
fi

dnf list instaled mysql &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
    dnf install mysql -y &>>$LOG_FILE_NAME
    VALIDATE $? "INSTALLING MYSQL"
else
    echo -e "MYSQL is already....$Y INSTALLED $N"
fi

dnf list installed git &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then
    dnf install git -y &>>$LOG_FILE_NAME
    VALIDATE $? "INSTALLING GIT"
else
    echo -e "git is already....$Y INSTALLED $N"
fi