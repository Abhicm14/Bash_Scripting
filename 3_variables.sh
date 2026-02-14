#! /bin/bash

# 2 types o variables in shell scripting 
#       1. System Variables
#       2. User defined Variables

# System Variables
echo Our Shell name is $BASH
echo Our Shell version name is $BASH_VERSION
echo Our Home Directory is $HOME
echo Our Current working Directory is $PWD

# User Variables
name=MARK
age=25

Name=Abhi
AGE_10=23

NAME=AMAR
AGE=23

echo The Name is $NAME age is $AGE

echo The Name is $name 
echo age is $age

echo The Name is $Name age is $AGE_10

# 10age=10 This is invalid because it should not start with numbers
# age = 23 this is invalid because it contains spaces after age and after equals sign

