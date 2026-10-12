#! /bin/bash

#Syntax for case statement
#case expression in
#   pattern1 )
#       statements ;;
#   pattern2 )
#       statements ;;
#   * )                 # '*'  it indicates default 
#       statements ;;
#esac

vehicle=$1

case $vehicle in
    "car" )
        echo "Rent of $vehicle is 100 dollar" ;;
    "van" )
        echo "Rent of $vehicle is 80 dollar" ;;
    "truck" )
        echo "Rent of $vehicle is 150 dollar" ;; 
    "bus" )
        echo "Rent of $vehicle is 200 dollar" ;;
    "bicycle" )
        echo "Rent of $vehicle is 10 dollar" ;;
    * )
        echo "$vehicle Not available" ;;
esac