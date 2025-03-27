
class AVLTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    @root = insert_node(@root, value)
  end

  def delete
  end

  def search(value)
  end

  def traverse
  end

  private

  def insert_node(node, value)
    return Node.new(value) if node.nil?

    if value > node.data
      node.right = insert_node(node.right, value)
    else
      node.left = insert_node(node.left, value)
    end

    node.height = 1 + [height(node.left), height(node.right)].max

    tree_balance = height(node.left) - height(node.right)

    return right_rotate(node) if tree_balance > 1 && value < node.left.data

    return left_rotate(node) if tree_balance < -1 && value > node.right.data

    # left - right rotation
    if tree_balance > 1 && value > node.left.data
      node.left = left_rotate(node.left)
      return right_rotate(node)
    end

    # right - left rotation
    if tree_balance < -1 && value < node.right.data
      node.right = right_rotate(node.right)
      return left_rotate(node)
    end

    node
  end

  def height(node)
    return 0 if node.nil?

    return node.height
  end

  def right_rotate(node)
  end

  def left_rotate(node)
    node
  end
end

private

class Node
  attr_accessor :data, :left, :right, :height

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
    @height = 0
  end
end
