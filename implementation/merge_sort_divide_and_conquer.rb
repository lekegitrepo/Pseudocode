
def merge_sort(array)
  return array if array.size <= 1

  mid = array.size / 2

  left = merge_sort(array[0...mid])
  right = merge_sort(array[mid..-1])

  merge(left, right)
end

def merge(left, right)
  sorted_array = []

  while !left.empty? && !right.empty?
    if left[0] <= right[0]
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
