#! /bin/bash

#Integer Comparison

#-eq - is equal to - if [ "$a" -eq "$b" ]
#-ne - is not equal to - if [ "$a" -ne "$b" ]
#-gt - is greater than - if [ "$a" -gt "$b" ]
#-ge - is greater than or equal to - if [ "$a" -ge "$b" ]
#-lt - is less than - if [ "$a" -lt "$b" ]
#-le - is less than or equal to - if [ "$a" -le "$b" ]

count=10

if [ $count -gt 9 ]
then
    echo "$count is greater than 9 true"
fi

if [ $count -ge 10 ]
then
    echo "$count is greater than Equal to 9 true"
fi

if [ $count -lt 12 ]
then
    echo "$count is less than 12 true"
fi

if [ $count -le 10 ]
then
    echo "$count is less than equal to 10 true"
fi

if [ $count -eq 10 ]
then
    echo "$count is equal to 10 true"
fi

if [ $count -ne 11 ]
then
    echo "$count is not equal to 11 true"
fi

if (( $count > 9 ))  
then
    echo "$count is greater than 9 true"
fi

if (( $count >= 10 ))
then
    echo "$count is greater than Equal to 9 true"
fi

if (( $count < 12 ))
then
    echo "$count is less than 12 true"
fi

if (( $count <= 10 ))
then
    echo "$count is less than equal to 10 true"
fi