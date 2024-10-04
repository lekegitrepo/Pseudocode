
def merge_sort_inversion_count(array)
  return [array, 0] if array.size <= 1
  
  mid = array.size / 2
  left, left_count = merge_sort_inversion_count(array[0...mid])
  right, right_count = merge_sort_inversion_count(array[mid..])

  inversion_count, merge_sort_array = merge_with_inversion(left, right)

  [merge_sort_array, left_count + right_count + inversion_count]
end

def merge_with_inversion(left, right)
  sorted_array = []
  counter = 0
  while !left.empty? && !right.empty?
    if left[0] <= right[0]
      sorted_array << left.shift
    else
      counter += left.size
      sorted_array << right.shift
    end
  end
  [counter, sorted_array + left + right]
end

arr = [2, 4, 1, 3, 5]
sorted_array, inversion_count = merge_sort_inversion_count(arr)
p sorted_array
p inversion_count
