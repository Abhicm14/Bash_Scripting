#! /bin/bash

echo $1 $2 $3 '> echo $1 $2 $3'

echo $0 $1 $2 $3 '> echo $1 $2 $3' #Index 0 contains the file name of the script

args=("$@")

echo ${args[0]} ${args[1]} ${args[2]}

echo $@ #it will print complete array elements

echo $# #it print number of arguments are passed


