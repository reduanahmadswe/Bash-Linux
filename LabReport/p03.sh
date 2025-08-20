# Name : Reduan Ahmad
# ID : 232-35-016
# Section : 41_A2

#!/bin/bash
read -p "Enter years separated by space: " -a years

for year in "${years[@]}"
do
    if (( (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0) ))
    then
        echo "$year is a Leap Year"
    else
        echo "$year is not a Leap Year"
    fi
done