#!/bin/bash

#using arrays which is used to store multiple values
#in arrays always index starts from 0

fruits=("apple" "banana" "mango" "orange")

#fruits is a variable which stores multiple values
#apple, banana, mango, orange are the values stored in fruits variable
#in arrays always index starts from 0
#apple is stored in 0th index
#banana is stored in 1st index etc

echo "print first fruit: ${fruits[0]}"
echo "print second fruit: ${fruits[1]}"

