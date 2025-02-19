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
    elsif @head.data > value
      node.next = @head
      @head.prev = node
      @head = node
    else
      current_node = @head
      current_node = current_node.next while current_node.next && current_node.next.data < value

      node.next = current_node.next
      node.prev = current_node

      @tail = node if node.next.nil?
    end
  end

  def find(value)
    return nil if @head.nil?

    current_node = @head
    current_node = current_node.next while current_node && current_node.data != value

    current_node
  end

  def delete(value)
    return nil if @head.nil?

    if @head.data == value
      @head = @head.next
    elsif @tail.data == value
      @tail = @tail.prev
    else
      current_node = @head.next
      current_node = current_node.next while current_node && current_node.data != value

      if current_node.next
        current_node.prev.next = current_node.next
        current_node.next.prev = current_node.prev
      end
    end
    @tail = nil if @head.nil?
  end

  def display_forward
    current_node = @head
    while current_node
      print "#{current_node.data} -> "
      current_node = current_node.next
    end
    puts "\n----"
  end

  def display_reverse
    current_node = @tail
    while current_node
      print "#{current_node.data} -> "
      current_node = current_node.prev
    end
    puts "\n----"
  end
end

doubly_linked_list = DoublyLinkedList.new

doubly_linked_list.append(8)
doubly_linked_list.append(13)
doubly_linked_list.append(18)
doubly_linked_list.display_forward
doubly_linked_list.display_reverse
# p doubly_linked_list

# doubly_linked_list.delete(13)

# p doubly_linked_list
