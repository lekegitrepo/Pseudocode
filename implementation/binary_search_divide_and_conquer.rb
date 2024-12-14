
# def binary_search(array, target, left, right)
#   return -1 if left > right

#   mid = (left + right) / 2

#   if array[mid] == target
#     return mid
#   elsif array[mid] > target
#     return binary_search(array, target, left, mid - 1)
#   else
#     return binary_search(array, target, mid + 1, right)
#   end
# end

def binary_search(array, target, left, right)
  return -1 if left > right

  mid = (left + right) / 2

  if array[mid] == target
    return array[mid]
  elsif array[mid] > target
    return binary_search(array, target, left, mid - 1)
  else
    return binary_search(array, target, mid + 1, right)
  end
end

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p binary_search(arr, 7, 0, arr.size - 1)
p binary_search(arr, 74, 0, arr.size - 1)
