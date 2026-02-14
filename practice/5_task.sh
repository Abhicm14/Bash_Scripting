#!/usr/bin/env bash
# Task 5: print all arguments with their positions

pos=1

while [ "$#" -gt 0 ]; do
    echo "Argument $pos: $1"
    pos=$((pos + 1))
    shift
done
