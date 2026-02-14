#! /bin/bash

var=31

readonly var

var=50 #value cannot be changed after declared as readonly 

echo "var => $var"

hello()
{
    echo "Hello World"
}

readonly -f hello #function cannot be altered after declared as readonly (use -f for function to make readonly before function name)

hello()
{
    echo "Hello World Again"
}