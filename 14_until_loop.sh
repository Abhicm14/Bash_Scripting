#! /bin/bash

# UNTIL Loops
# Syntax
# until [ condition ]
# do
#   statements
# done

n=1

until [ $n -ge 10 ]
do
    echo $n
    (( n++ ))
done

until (( $n > 20 ))
do
    echo $n
    (( ++n ))
done