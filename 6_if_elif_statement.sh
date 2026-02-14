#! /bin/bash

#if [ condition ]
#then
#    statement
#elif [ condition ]
#then
#    statement
#else
#    statement
#fi

count=10

if [ $count -lt 9 ]
then
    echo "$count is less than 9"
elif [ $count -gt 9 ]
then
    echo "$count is greater than 9"
else
    echo "$count is Equal to 9"
fi
