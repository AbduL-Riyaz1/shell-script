#!/bin/bash

source ./common.sh
SOURCE_DIR="/home/ec2-user/app-logs"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then 
        echo "You must have sudo access to execute this script"
        exit 1
    fi
}
echo "Script is executeing at: $TIMESTAMP" &>>$LOG_FILE_NAME

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "Files to be delated: $FILES_TO_DELETE"

while read -r filepath # here filepath is the variable name, you can give any name
do
    echo "Deleting file: $filepath" &>>$LOG_FILE_NAME
    rm -rf $filepath
    echo "Deleted file: $filepath"
done <<< $FILES_TO_DELETE