# Name : Reduan Ahmad
# ID : 232-35-016
# Section : 41_A2

#!/bin/bash
read -p "Enter a limit: " limit
sum=0
for (( i=1; i<=limit; i++ ))
do
    sum=$((sum + i))
done
echo "Sum of numbers form 1 to $limit numbers is: $sum"