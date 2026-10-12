#! /bin/bash

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

#set -x start debugging in the script file
#set +x stop debugging in the script file 
# #! /bin/bash -x it also starts debugging script / bash -x ./filename in the command starts debugging