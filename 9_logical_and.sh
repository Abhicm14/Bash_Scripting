#! /bin/bash

echo -e "Enter the age : \c"
read age

#Type 1
if [ "$age" -gt 18 ] && [ "$age" -lt 30 ]
then
    echo "Valid age"
else
    echo "Age is not Valid"
fi

#Type 2
if [ "$age" -gt 18 -a "$age" -lt 30 ] #a is the AND Operator
then
    echo "Valid age"
else
    echo "Age is not Valid"
fi

#Type 3
if [[ "$age" -gt 18  &&  "$age" -lt 30 ]]
then
    echo "Valid age"
else
    echo "Age is not Valid"
fi