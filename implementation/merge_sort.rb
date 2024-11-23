
def merge_sort(array)
  return array if array.size <= 1

  mid = array.size / 2
  left = merge_sort(array[0...mid])
  right = merge_sort(array[mid..])

  merge(left, right)
end

def merge(left, right)
  sorted_array = []
  until left.empty? || right.empty?
    if left.first <= right.first
      sorted_array << left.shift
    else
      sorted_array << right.shift
    end
  end
  sorted_array + left + right
end

arr = [3, 9, 1, 10, 8, 55, 2]
p arr
p merge_sort(arr)
