#! /bin/bash

num1=1

while [ $num1 -le 3 ] 
do
    echo "$num1"
    (( num1++ ))
    xterm &
done