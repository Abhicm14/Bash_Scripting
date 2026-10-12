#! /bin/bash

#if [ condition ]
#then
#    statement
#else
#    statement
#fi

count=10

if [ $count -lt 9 ]
then
    echo "$count is less than 9 true"
else
    echo "$count is greater than 9 true" 
fi
