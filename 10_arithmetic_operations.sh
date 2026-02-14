#! /bin/bash

echo -e "Enter the Number1 and Number2 : \c"
read num1 num2

#Using echo command
echo $(( num1 + num2 ))
echo $(( num1 - num2 ))
echo $(( num1 * num2 ))
echo $(( num1 / num2 ))
echo $(( num1 % num2 ))

#Using expr command
echo -e "\n"
echo $(expr $num1 + $num2)
echo $(expr $num1 - $num2)
echo $(expr $num1 \* $num2)
echo $(expr $num1 / $num2)
echo $(expr $num1 % $num2)

#The Above will support only Integer Values Not the Float Values 