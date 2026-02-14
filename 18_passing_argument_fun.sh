#! /bin/bash

#one argument
function print()
{
    echo $1
}

#multiple argumnet
print1()
{
    echo $1 $2
}

quit()
{
    exit
}

print Hello
print1 Hello World

quit