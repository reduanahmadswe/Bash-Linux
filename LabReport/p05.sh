# Name : Reduan Ahmad
# ID : 232-35-016
# Section : 41_A2

#!/bin/bash
read -p "Enter floating numbers separated by space: " -a array
sum=0
size=${#array[@]}
for num in "${array[@]}"
do
    sum=$(awk "BEGIN {print $sum + $num}")
done

avg=$(awk "BEGIN {print $sum / $size}")
echo "Average = $avg"