#!/bin/bash

echo "All variables: $@"
echo "number of variables: $#"
echo "script name: $0"
echo "present working directory: $PWD"
echo "Home directory of current user: $HOME"
echo "which user is running the script: $USER"
echo "Process id of current script: $$"
sleep 60 &
echo "Process id of last command in background: $!"