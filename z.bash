#!/bin/bash

# here the ? holds the exit value of the most recent completed process and the : is the conditional operator
# so the value of be will be 10 if a<10 or 6 if a<100 or else 5
a=10
b=$(($a<10?10:$a<100?6:5))
echo $a
echo "now set b based on the value of a: where b = $ (( $ a<10?10: $ a<100?6:5))"
echo "and we see that b will be equal to 6"
echo $b
#exit 0
