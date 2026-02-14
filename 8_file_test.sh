#! /bin/bash

# File Test Operators
# -e file exists
# -f file is a regular file
# -d is a directory
# -s file is not zero size
# -r file has read permission
# -w file has write permission
# -x file has execute permission 

# -c char file
# -b binary file

echo -e "Enter the name of the file : \c" #e Enables the use of blackslash
read file_name

if [ -e $file_name ]
then
    echo "$file_name found"
else
    echo "$file_name Not found"
fi