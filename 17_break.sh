#! /bin/bash

for (( num=1; num<=10; num++ ))
do
    if [ $num -gt 5 ]
    then
        break
    fi
    echo "$num"
done