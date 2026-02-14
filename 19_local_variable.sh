#! /bin/bash

function print()
{
    local name=$1 #local keyword is makes name variable local for this function
    echo "The name is $name"
}

name="Tom"

echo "The name is $name : Before"

print Max

echo "The name is $name : After"