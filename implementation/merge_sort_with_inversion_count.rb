
def merge_sort_with_inversion_count(array)
  return [array, 0] unless array.size > 1

  mid = array.size / 2

  left, left_inversion_count = merge_sort_with_inversion_count(array[0...mid])
  right, right_inversion_count = merge_sort_with_inversion_count(array[mid..])

  sorted_array, inversion_count = merge_with_inversion_count(left, right)
  [sorted_array, left_inversion_count + right_inversion_count + inversion_count]
end

def merge_with_inversion_count(left, right)
  sorted_array = []
  inversion_count = 0

  until left.empty? || right.empty?
    if left[0] < right[0]
      sorted_array << left.shift
    else
      sorted_array << right.shift
      inversion_count += left.size
    end
  end

  [sorted_array.concat(left).concat(right), inversion_count]
end

arr = [3, 5, 1, 9, 10, 2, 3, 6, 8, 7]
sorted_arr, inversion_count = merge_sort_with_inversion_count(arr)
p sorted_arr
p inversion_count
