
class AVLTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    @root = insert_node(@root, value)
  end

  def delete(value)
    @root = delete_node(@root, value)
  end

  def search(value)
    search_node(@root, value)
  end

  def in_order_traversal(node, result = [])
    return if node.nil?

    in_order_traversal(node.left, result)
    result << node.data
    in_order_traversal(node.right, result)

    result
  end

  private

  def search_node(node, value)
    return nil if node.nil?

    return node if node.data == value

    if value > node.data
      search_node(node.right, value)
    else
      search_node(node.left, value)
    end
  end

  def delete_node(node, value)
    return nil if node.nil?

    if value > node.data
      node.right = delete_node(node.right, value)
    elsif value < node.data
      node.left = delete_node(node.left, value)
    else
      if node.left.nil? || node.right.nil?
        node = node.left || node.right
      else
        successor_node = get_min_node(node.right)
        node.data = successor_node.data
        node.right = delete_node(node.right, successor_node.data)
      end
    end

    return node if node.nil?

    node.height = 1 + [height(node.left), height(node.right)].max

    balance = height(node.left) - height(node.right)

    # left rotation
    return right_rotate(node) if balance > 1 && get_balance(node.left) >= 0

    # right rotation
    return left_rotate(node) if balance < -1 && get_balance(node.right) <= 0

    # left-right rotation
    if balance > 1 && get_balance(node.left) < 0
      node.left = left_rotate(node.left)
      return right_rotate(node)
    end

    # right-left rotation
    if balance < -1 && get_balance(node.right) > 0
      node.right = right_rotate(node.right)
      return left_rotate(node)
    end

    return node
  end

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
    left_subtree = node.left
    left_subtree_right_child = left_subtree.right

    left_subtree.right = node
    node.left = left_subtree_right_child

    node.height = 1 + [height(node.left), height(node.right)].max
    left_subtree.height = 1 + [height(left_subtree.left), height(left_subtree.right)].max

    left_subtree
  end

  def left_rotate(node)
    right_subtree = node.right
    right_subtree_left_child = right_subtree.left

    right_subtree.left = node
    node.right = right_subtree_left_child

    node.height = 1 + [height(node.left), height(node.right)].max
    right_subtree.height = 1 + [height(right_subtree.left), height(right_subtree.right)].max

    right_subtree
  end
  
  def get_min_node(node)
    node = node.left while node.left

    node
  end

  def get_balance(node)
    return 0 if node.nil?

    height(node.left) - height(node.right)
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
