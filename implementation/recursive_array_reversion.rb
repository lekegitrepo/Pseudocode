
def reverse_array(array)
  return [] if array.nil? || array.empty?

  return reverse_array(array[1..]) << array[0]
end

p reverse_array([1, 2, 3, 4, 5])
