# Name : Reduan Ahmad
# ID : 232-35-016
# Section : 41_A2

#!/bin/bash
read -p "Enter numbers with by space: " -a array
sum=0

for num in "${array[@]}"
do
    sum=$((sum+num))
done
size=${#array[@]}
avg=$((sum/size))
echo "Average = $avg"