#! /bin/bash

echo
echo "Digital Clock for Linux"
echo "To stop this Clock use command kill pid, see above for pid"
echo "Press a key to continue..."

while :
do
    ti=`date +"%r"`
    echo -e -n "\033[7s"

    tput cup 0 69

    echo -n $ti

    echo -e -n "\033[8u"

    sleep 1
done
