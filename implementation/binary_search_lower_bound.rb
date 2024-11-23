
def binary_search_lower_bound(array, target)
  left, right = 0, array.length

  while left < right
    mid = (left + right) / 2

    if array[mid] < target
      left = mid + 1
    else
      right = mid
    end
  end

  return left if left < array.length && array[left] >= target

  return -1
end
