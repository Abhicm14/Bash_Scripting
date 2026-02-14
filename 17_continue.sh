#! /bin/bash

for (( num=1; num<=10; num++ ))
do
    if [ $num -eq 3 -o $num -eq 6 ]
    then
        continue;
    fi
    echo "$num"
done