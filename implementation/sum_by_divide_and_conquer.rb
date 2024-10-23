
def sum_array(arr)
  return arr[0] if arr.size == 1

  mid = arr.size / 2

  left_sum = sum_array(arr[0...mid])
  right_sum = sum_array(arr[mid..])

  left_sum + right_sum
end

arr1 = [1, 2]
arr2 = [1, 2, 3, 4, 5]
p sum_array(arr1)
p sum_array(arr2)
