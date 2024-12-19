
def find_minimum(array)
  return array[0] if array.size == 1

  mid = array.size / 2

  left = find_minimum(array[0...mid])
  right = find_minimum(array[mid..])

  left <= right ? left : right
end

p find_minimum([3, 9, 20, 85, 23])
p find_minimum([13, 9, 7, 8, 10, 13, 5])
