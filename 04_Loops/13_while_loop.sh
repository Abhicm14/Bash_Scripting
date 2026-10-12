#! /bin/bash

#Syntax
#while [ condition ]
#do
#   statements
#done

num1=1

while [ $num1 -le 10 ] 
do
    echo "$num1"
    num1=$(( num1+1 )) 
done

echo -e "\n"
num=1

while (( $num <= 10 ))
do
    echo "$num"
    (( ++num ))
done