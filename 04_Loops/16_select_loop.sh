#! /bin/bash

#syntax
#select varName in list
#do
#    statement
#done

select name in mark jhon tom ben
do
    case $name in
    mark)
        echo mark selected ;;
    jhon)
        echo jhon selected ;;
    tom)
        echo tom selected ;;
    ben)
        echo ben selected ;;
    *)
        echo "Error please provide the no. between 1..4"
    esac
done