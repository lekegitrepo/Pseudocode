
def tail_recursive_sum(array, acc = 0)
  return acc if array.nil? || array.empty?

  tail_recursive_sum(array[1..], array[0] + acc)
end

p tail_recursive_sum([3, 9])
p tail_recursive_sum([3, 9, 7, 8])
