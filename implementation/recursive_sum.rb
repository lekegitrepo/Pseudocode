
def recursive_sum(array)
  return 0 if array.nil? || array.empty?

  return array[0] + recursive_sum(array[1..])
end

p recursive_sum([3, 9])
p recursive_sum([3, 9, 7, 8])
