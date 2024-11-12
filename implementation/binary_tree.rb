class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinaryTree
  attr_accessor :root

  def initialize(root_value)
    @root = Node.new(root_value)
  end

  def inorder_traversal(node, result = [])
    return if node.nil?

    inorder_traversal(node.left, result)
    result << node.value
    inorder_traversal(node.right, result)

    result
  end
end
