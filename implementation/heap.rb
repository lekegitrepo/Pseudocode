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

    update_max_heap(heap, index)

    heap
  end

  def extract_max(heap)
    return heap if heap.nil? || heap.size <= 1

    max_value = heap[0]
    heap[0] = heap.pop
    index = 0

    while !heap[2 * index + 1].nil?
      left = 2 * index + 1
      right = 2 * index + 2
      max_index = left

      if right < heap.size && heap[left] < heap[right]
        max_index = right
      end

      if heap[index] < heap[max_index]
        swap(heap, max_index, index)
        index = max_index
      end
    end

    max_value
  end

  def build_max_heap(arr)
    arr_size = arr.size

    ((arr_size / 2) - 1).downto(0) { heapify(arr, _1, arr_size) }
    arr
  end

  def delete_at(array, i)
    arr_size = array.size
    return nil if i >= arr_size

    array[i] = array[arr_size - 1]
    array.pop
    
    parent = parent_index(i)

    if i > 0 && array[i] > array[parent]
      update_max_heap(array, i)
    else
      heapify(array, i, array.size)
    end
    array
  end

  private

  def heapify(heap, index, heap_size)
    left = left_child_index(index)
    right = right_child_index(index)
    max_index = index

    max_index = left if left < heap_size && heap[left] > heap[max_index]

    max_index = right if right < heap_size && heap[right] > heap[max_index]

    if max_index != index
      swap(heap, index, max_index)
      heapify(heap, max_index, heap_size)
    end
  end

  def update_max_heap(heap, index)
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
