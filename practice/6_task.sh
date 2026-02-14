#!/usr/bin/env bash
# Task 6: parse -f inputfile, -v (verbose), -o outputfile

file=""
verbose=0
output="/dev/stdout"

usage() {
    echo "Usage: $0 -f inputfile [-v] [-o outputfile]" >&2
    exit 1
}

while getopts ":f:vo:" opt; do
    case "$opt" in
        f) file="$OPTARG" ;;
        v) verbose=1 ;;
        o) output="$OPTARG" ;;
        \?) echo "Unknown option: -$OPTARG" >&2; usage ;;
        :)  echo "Option -$OPTARG requires an argument" >&2; usage ;;
    esac
done
shift $((OPTIND - 1))

[ -z "$file" ] && { echo "Error: -f inputfile is required." >&2; usage; }

if [ ! -r "$file" ]; then
    echo "Error: cannot read input file '$file'" >&2
    exit 1
fi

if [ "$verbose" -eq 1 ]; then
    if [ "$output" = "/dev/stdout" ]; then
        echo "Copying '$file' to standard output"
    else
        echo "Copying '$file' to '$output'"
    fi
fi

# Copy using cat and redirection
cat "$file" >"$output"
