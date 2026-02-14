#! /bin/bash

if [ $# -ne 2 ]
then
    echo "Usage -$0 x y"
    echo "      Please Pass The 2 Numbers With the File Name as Arguments"
    exit 1
fi
    echo "Sum of $1 and $2 is  $(expr $1 + $2)"