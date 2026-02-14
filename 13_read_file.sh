#! /bin/bash

while read line
do
    echo $line
done < test

cat test | while read line
do
    echo $p
    line
done