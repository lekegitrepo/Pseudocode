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

  def add_node(value)
    @root = insert(@root, value)
  end

  def insert(node, value)
    return Node.new(value) if node.nil?

    if node.value < value
      node.right = insert(node.right, value)
    else
      node.left = insert(node.left, value)
    end
    node
  end

  # in_order_traversal: left, root, right
  def in_order_traversal(node, result = [])
    return if node.nil?

    in_order_traversal(node.left, result)
    result << node.value
    in_order_traversal(node.right, result)

    result
  end.
end

# tree = BinaryTree.new(8)

# tree.root.left = Node.new(3)
# tree.root.right = Node.new(15)
# tree.root.left.left = Node.new(2)
# tree.root.left.right = Node.new(5)
# tree.root.right.left = Node.new(10)
# tree.root.right.right = Node.new(20)

# p tree.inorder_traversal(tree.root)

tree = BinaryTree.new(10)
[5, 15, 3, 7, 12, 18].each { |value| tree.add_node(value) }

# Performing the traversals
puts "Inorder Traversal: #{tree.in_order_traversal(tree.root)}"
puts "PostOrder Traversal: #{tree.post_order_traversal(tree.root)}"
puts "PreOrder Traversal: #{tree.pre_order_traversal(tree.root)}"
