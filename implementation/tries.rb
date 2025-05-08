
class TrieNode
  attr_accessor :root

  def initialize
    @root ||= Node.new
  end

  def insert(word)
    node = root
    word.split.each do |char|
      node.children[char] = Node.new if !node.children[char]
      node = node.children[char]
    end
    node.end_of_word = true
  end
end

private

class Node
  attr_accessor :children, :end_of_word
  
  def initialize
    children = {}
    end_of_word = false
  end
end
