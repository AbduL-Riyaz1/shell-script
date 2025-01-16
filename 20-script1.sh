#!/bin/bash

MSG="script1"
GREET="Hello from script1"
source ./21-script2.sh

echo "Hello from: $MSG"
echo "A value: $A"

#sh 21-script2.sh