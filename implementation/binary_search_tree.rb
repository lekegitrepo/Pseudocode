require 'pry'

class BST
  attr_accessor :root

  def initialize
    @root = nil
  end
  # [5, 6, 3, 16, 12, 8]
  def insert(data)
    @root = insert_node(@root, data)
  end

  def insert_node(node, data)
    return Node.new(data) if node.nil?

    if node.data > data
      node.left = insert_node(node.left, data)
    else
      node.right = insert_node(node.right, data)
    end
    node
  end

  def search(data)
    search_nodes(@root, data)
  end

  def search_nodes(node, data)
    return nil if node.nil?

    return node if node.data == data

    if node.data > data
      search_nodes(node.left, data)
    else
      search_nodes(node.right, data)
    end
  end

  def in_order_traversal(node, result)
    return nil if node.nil?

    in_order_traversal(node.left, result)
    result << node.data
    in_order_traversal(node.right, result)

    result
  end
end

private

class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    left = nil
    right = nil
  end
end
