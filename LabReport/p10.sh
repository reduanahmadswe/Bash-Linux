# Name : Reduan Ahmad
# ID : 232-35-016
# Section : 41_A2

#!/bin/bash
read -p "Enter first number: " a
read -p "Enter second number: " b
read -p "Enter third number: " c

if((a>b));
then
    if((a>c));
    then
        echo "$a is the largest"
    else
        echo "$c is the largest"
    fi
else
    if ((b>c));
    then
        echo "$b is the largest"
    else
        echo "$c is the largest"
    fi
fi