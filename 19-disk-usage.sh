#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESOLD=5 # in real project we monitor 80

while read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}')
    PARTITION=$(echo $line | awk -F " " '{print $NF}')
    echo "PARTITION: $PARTITION , USAGE: $USAGE"

done <<< $DISK_USAGE