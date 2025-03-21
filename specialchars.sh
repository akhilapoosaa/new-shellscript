#!/bin/bash

#using special varaibles in shell script

NUM1=$1
NUM2=$2

SUM=$(($NUM1 + $NUM2))
SUB=$(($NUM1 - $NUM2))
MUL=$(($NUM1 * $NUM2))
DIV=$(($NUM1 / $NUM2))

echo "SUM of $NUM1 and $NUM2 is $SUM"
echo "SUB of $NUM1 and $NUM2 is $SUB"       
echo "MUL of $NUM1 and $NUM2 is $MUL"
echo "DIV of $NUM1 and $NUM2 is $DIV"

echo "The script name is $0"
echo "The number of arguments passed is $#"
echo "The arguments passed are $@"
