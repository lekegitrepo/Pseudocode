
def tail_recursive_sum(array, acc = 0)
  return acc if array.nil? || array.empty?

  return tail_recursive_sum(array[1..], acc + array[0])
end

p tail_recursive_sum([3, 9])
p tail_recursive_sum([3, 9, 7, 8])
