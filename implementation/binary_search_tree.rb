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

  def search(data)
    search_nodes(@root, data)
  end

  def in_order_traversal(node, result)
    return nil if node.nil?

    in_order_traversal(node.left, result)
    result << node.data
    in_order_traversal(node.right, result)

    result
  end

  def delete(value)
    @root = delete_node(@root, value)
  end

  private

  def insert_node(node, data)
    return Node.new(data) if node.nil?

    if node.data > data
      node.left = insert_node(node.left, data)
    else
      node.right = insert_node(node.right, data)
    end
    node
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

  def delete_node(node, value)
    return nil if node.nil?

    if node.data > value
      node.left = delete_node(node.left, value)
    elsif node.data < value
      node.right = delete_node(node.right, value)
    else
      return node.right if node.left.nil?

      return node.left if node.right.nil?

      node_successor = find_min_node(node.right)
      node.data = node_successor.data

      node.right = delete_node(node.right, node_successor.data)
    end
    node
  end

  def find_min_node(node)
    current_node = node
    current_node = current_node.left while current_node.left

    current_node
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
