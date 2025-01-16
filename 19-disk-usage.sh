#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESOLD=5 # in real project we monitor 80
MSG=""

while read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk -F " " '{print $NF}')
    #echo "PARTITION: $PARTITION , USAGE: $USAGE"
    if [ $USAGE -ge $DISK_THRESOLD ]
    then
        MSG+="High Disk Usage on Partition : $PARTITION Usage is: $USAGE \n"
    fi

done <<< $DISK_USAGE

echo -e "Massage: $MSG"