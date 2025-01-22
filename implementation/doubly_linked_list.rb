class Node
  attr_accessor :data, :next, :prev

  def initialize(data)
    @data = data
    @next = nil
    @prev = nil
  end
end

class DoublyLinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
  end

  def prepend(value)
  end

  def insert(value)
  end

  def delete(value)
  end

  def find(value)
  end
end
