# frozen_string_literal: true

class Heap
  def min_heap_insertion(heap_arr, value)
    heap_arr << value
    index = heap_arr.size - 1

    while index > 0
      parent_index = parent_index(index)
      if heap_arr[parent_index] > heap_arr[index]
        swap(heap_arr, parent_index, index)
        index = parent_index
      else
        break
      end
    end
    heap_arr
  end

  def max_heap_insertion(heap, value)
    heap << value
    index = heap.size - 1

    while index > 0
      parent = parent_index(index)
      if heap[parent] < heap[index]
        swap(heap, parent, index)
        index = parent
      else
        break
      end
    end
  end

  private

  def swap(arr, i, j)
    temp = arr[i]
    arr[i] = arr[j]
    arr[j] = temp
  end

  def parent_index(i)
    (i - 1) / 2
  end

  def left_child_index(i)
    (2 * i) + 1
  end

  def right_child_index(i)
    (2 * i) + 2
  end
end
