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
    node = Node.new(value)

    if @head.nil?
      @head = node
      @tail = node
    else
      node.prev = @tail
      @tail.next = node
      @tail = node
    end
  end

  def prepend(value)
    node = Node.new(value)

    if @head.nil?
      @head = node
      @tail = node
    else
      @head.prev = node
      node.next = @head
      @head = node
    end
  end

  def insert(value)
    node = Node.new(value)

    if @head.nil?
      @head = node
      @tail = node
    else
      current_node = @head
      current_node = current_node.next while current_node.next && current_node.next.data < value

      node.next = current_node.next
      node.prev = current_node

      node = current_node.next.next if current_node.next

      @tail = node if node.next.nil?
    end
  end
end
