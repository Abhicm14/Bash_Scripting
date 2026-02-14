#! /bin/bash

#for loops

#syntax
#for VARIABLE in 1 2 3 4 5 .. N
#do
#   statements
#done

for num in 1 2 3 4 5
do
    echo $num
done

for num in {1..10} #RANGE{START..END}
do
    echo $num
done

for num in {0..10..2} #RANGE with stepsize{START..END..STEPSIZE}
do
    echo $num
done

for (( num=0; num<5; num++ ))
do
    echo $num
done