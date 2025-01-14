#!/bin/bash


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DESTIN_DIR=$
DAYS=${3:-14} #if  user not given days by default ew give 14 days

LOGS_FOLDER="/home/ec2-user/shellscript.logs/"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 $R....FAILURE $N"
        exit 1
    else
        echo -e "$2 $G....SUCCESS $N"
    fi
}
USAGE(){
    echo -e "$R USAGE::$N sh 18-backup.sh <SOURCE_DIR> <DESTIN_DIR> <DAYS>"
    exit 1
}
mkdir -p /home/ec2-user/shellscript.logs/

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$SOURCE_DIR does not exits $Y.....Please check $N"
    exit 1
fi

if [ ! -d $DESTIN_DIR ]
then
    echo -e "$DESTIN_DIR does not exits $Y.....Please check $N"
    exit 1
fi


echo "Script is executeing at: $TIMESTAMP" &>>$LOG_FILE_NAME