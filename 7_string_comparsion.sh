#! /bin/bash

#String Comparison

#= - is equal to - if [ "$a" = "$b" ]
#== - is equal to - if [ "$a" == "$b" ]
#!= - is not equal to - if [ "$a" != "$b" ]
#-z - string is empty (null) - if [ -z "$a" ]
#-n - string is not empty - if [ -n "$a" ]
#< - is less than (in ASCII alphabetical order) - if [[ "$a" < "$b" ]]
#> - is greater than (in ASCII alphabetical order) - if [[ "$a" > "$b" ]]

word=abc

if [ $word = "abc" ]
then
    echo "String is equal"
fi

if [ $word == "abc" ]
then
    echo "String is equal"
fi

if [ $word != "abcc" ]
then
    echo "String is not equal"
fi

if [ -z "$word" ]
then
    echo "string is Empty"
fi

if [ -n "$word" ]
then
    echo "String is not Empty"
fi

if [[ $word < "def" ]]
then
    echo "String is less than "
fi

if [[ "xyz" > $word ]]
then
    echo "String is greater than"
fi