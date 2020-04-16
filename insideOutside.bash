#!/bin/bash


var1='A'
var2='B'
echo
echo "------> Before the function call var1: $var1, var2: $var2"
function my_func {
local var1='C'
var2='D'
echo "------> Inside the function var1: $var1, var2: $var2"
}
my_func
echo "------> After the function call var1: $var1, var2: $var2"
echo
