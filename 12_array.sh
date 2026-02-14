#! /bin/bash

os=('Ubuntu' 'Windows' 'Kali')
os[3]='mac'
echo "${os[@]}"
echo "${os[0]}"
echo "${os[1]}"
echo "${os[2]}"

echo "${!os[@]}" #print index of elements use ! symbole
echo "${#os[@]}" #number of elements by using # symbole

unset os[2] #unset is used to remove elements from array
echo "${os[@]}"