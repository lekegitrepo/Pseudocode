
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

  def append(data)
    node = Node.new(data)
    if @head.nil?
      @head = node
    else
      current_node = @head
      current_node = current_node.next while current_node.next

      current_node.next = node
    end
  end
end

linked_list = LinkedList.new

linked_list.append(10)
linked_list.append(28)

p linked_list
