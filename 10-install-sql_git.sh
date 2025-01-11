#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR::You Must Have Sudo Acess To Execute This Script"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ] 
then # not installed
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "Installing mysql.....FAILED"
        exit 1
    else
        echo "Installing mysql.....SUCCESS"
    fi
else
    echo "MYSQL is Already.....INSTALLED"
fi

# if [ $? -ne 0 ]
#     then
#         echo "Installing mysql.....FAILED"
#         exit 1
#     else
#         echo "Installing mysql.....SUCCESS"
#     fi

dnf installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "Installing GIT.....FAILED"
        exit 1
    else
        echo "Installing GIT.....SUCCESS"
    fi
else
    echo "GIT is Already.....INSTALLED"
fi

# if [ $? -ne 0 ]
# then
#     echo "Installing git.....FAILED"
#     exit 1
# else
#     echo "Installing git.....SUCCESS"
# fi
