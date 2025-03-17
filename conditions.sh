#!/bin/bash

#using if condition

Number=$1

if [ $Number -gt 100 ]
then 
    echo "$Number is gretaer than 100"
else
    echo "$Number is less than 100"    
fi    