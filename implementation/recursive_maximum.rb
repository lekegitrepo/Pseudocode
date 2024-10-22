
def recursive_maximum(array)
  return 0 if array.nil? || array.empty?

  max_arr_rest = recursive_maximum(array[1..])

  return array[0] >= max_arr_rest ? array[0] : max_arr_rest
end

p recursive_maximum([3, 9])
p recursive_maximum([13, 9, 7, 8, 10])
