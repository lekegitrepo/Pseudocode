
class Node
  attr_accessor :data, :next

  def initialize(data, next_node = nil)
    @data = data
    @next = next_node
  end
end

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
    else
      current_node = @head
      current_node = current_node.next while current_node.next

      current_node.next = node
    end
  end

  def insert(value)
    return 'The value already exist in nodes' if find(value)

    new_node = Node.new(value)

    if @head.nil? || value < @head.data
      new_node.next = @head
      @head = new_node
      return
    end

    current_node = @head
    current_node = current_node.next while current_node.next && current_node.next.data < value

    new_node.next = current_node.next

    current_node.next = new_node
  end

  def find(value)
    return @head if @head.data == value || @head.nil?

    current_node = @head.next
    current_node = current_node.next while current_node && current_node.data != value

    current_node
  end
end

linked_list = LinkedList.new

linked_list.append(10)
linked_list.append(28)
linked_list.append(30)

linked_list.insert(12)

p linked_list

p linked_list.find(28)
p linked_list.find(10)
