
def binary_search_upper_bound(array, target)
  left, right = 0, array.length

  while right > left
    mid = (left + right) / 2

    if target > array[mid]
      left = mid + 1
    else
      right = mid
    end
  end

  return right if right < array.length && array[right] >= target

  return -1
end

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p binary_search_upper_bound(arr, 6)
p binary_search_upper_bound(arr, 86)
