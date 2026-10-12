#! /bin/bash

#To calculate floating values we use "bc" command "bc means basic calculator" 
echo -e "Enter the Number1 and Number2 : \c"
read num1 num2 num

#Using echo command
echo "$num1+$num2" | bc
echo "$num1-$num2" | bc
echo "$num1*$num2" | bc
echo "scale=2;$num1/$num2" | bc #scale used to get the number of decimal points in this i will get 2 digits decimal point value
echo "$num1%$num2" | bc

echo "scale=2;sqrt($num)" | bc -l #-l for math library for sqrt function
echo "scale=2;2^3" | bc -l