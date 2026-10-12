#! /bin/bash

#man signal
file=/mnt/e/Training/Shell_Scripting/test

trap "rm -f $file && echo file deleted; exit" 0 2 15

echo "PID is $$"
while (( count < 10 ))
do
    sleep 2
    (( count++ ))
    echo $count
done
exit 0