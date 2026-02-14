#! /bin/bash

usage()
{
    echo "You need to provide an argument : "
    echo "Usage : $0 file_name"
}

is_file_exist()
{
    local filename="$1"
    [[ -f "$filename" ]] && return 0 || return 1
}

[[ $# -eq 0 ]] && usage

if ( is_file_exist "$1" )
then
    echo "File Found"
else
    echo "File not Found"
fi