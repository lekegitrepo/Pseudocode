class Node
  attr_accessor :data, :next

  def initialize(value)
    @data = value
    @next = nil
  end
end

class CircularLinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    node = Node.new(value)

    if @head.nil?
      @head = node
      @head.next = @head
    else
      current_node = @head
      current_node = current_node.next while current_node.next != @head

      node.next = @head
      current_node.next = node
    end
  end

  def insert(value)
    node = Node.new(value)

    if @head.nil?
      @head = node
      node.next = @head
    elsif @head.data > value
      node.next = @head
      @head = node
    else
      current_node = @head
      current_node = current_node.next while current_node.data < value && current_node.next != @head

      node.next = @head if current_node.next == @head
      current_node.next = node
    end
  end

  def display
  end
end
