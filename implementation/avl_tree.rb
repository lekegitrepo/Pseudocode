
class AVLTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
  end

  def delete
  end

  def search(value)
  end

  def traverse
  end
end

private

class Node
  attr_accessor :data, :left, :right, :height

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
    @height = nil
  end
end
