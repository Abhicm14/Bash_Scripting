#! /bin/bash

echo "Enter names : "
read -a names # a indicates the store input in the array

echo "Name at 0th index : ${names[0]}"
echo "Names : ${names[0]},${names[1]}"
