
def sum_array(array)
  return array[0] if array.size == 1

  mid = array.size / 2

  sum_array(array[0...mid]) + sum_array(array[mid..])
end

arr1 = [1, 2]
arr2 = [1, 2, 3, 4, 5]
p sum_array(arr1)
p sum_array(arr2)
