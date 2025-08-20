# Name : Reduan Ahmad
# ID : 232-35-016
# Section : 41_A2

#!/bin/bash
read -p "Enter your percentage: " percentage

if (( percentage >= 90 )); then
    echo "Grade A"
    elif (( percentage >= 80 )); then
    echo "Grade B"
    elif (( percentage >= 70 )); then
    echo "Grade C"
else
    echo "Grade D"
fi




