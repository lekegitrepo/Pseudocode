
def find_maximum(array)
  return array[0] if array.size == 1

  mid = array.size / 2

  left = find_maximum(array[0...mid])
  right = find_maximum(array[mid..])

  left >= right ? left : right
end

p find_maximum([3, 9, 20, 85, 23])
p find_maximum([13, 9, 7, 8, 10, 13, 5])

