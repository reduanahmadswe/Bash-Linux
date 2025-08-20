# arr=(10 20 30 40)

# echo ${arr[@]}
# echo "Length of array is : ${#arr[@]}"
# echo "First element is : ${arr[0]}"
# echo "Second element is : ${arr[1]}"
# echo "Third element is : ${arr[2]}"
# echo "Fourth element is : ${arr[3]}"



arr=(apple banana cherry date)

for item in "${arr[@]}"
do 
    echo "Fruit : $item"
done