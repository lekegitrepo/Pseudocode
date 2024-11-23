
def recursive_maximum(array)
  return 0 if array.nil? || array.empty?

  max_arr = recursive_maximum(array[1..])

  array[0] >= max_arr ? array[0] : max_arr
end

p recursive_maximum([3, 9])
p recursive_maximum([13, 9, 7, 8, 10])
