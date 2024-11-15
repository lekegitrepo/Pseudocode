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

tree = BinaryTree.new(8)

tree.root.left = Node.new(3)
tree.root.right = Node.new(15)
tree.root.left.left = Node.new(2)
tree.root.left.right = Node.new(5)
tree.root.right.left = Node.new(10)
tree.root.right.right = Node.new(20)

p tree.inorder_traversal(tree.root)
