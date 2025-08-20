# Name : Reduan Ahmad
# ID : 232-35-016
# Section : 41_A2

#!/bin/bash
for ((i=1; i<=20; i+=2))
do
    if (( $i == 13 )); then
        continue
    fi
    echo $i
done