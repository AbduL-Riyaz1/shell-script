#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 100 ]  # -gt (greater than) -lt(lessthan)-ge(graterthan or equal) -le(lessthan or equal)
then
    echo "Given number is Greater than 100"
else
    echo "Given number is less than or equal to 100"
fi