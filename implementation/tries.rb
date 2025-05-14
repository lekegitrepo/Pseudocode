
class TrieNode
  attr_accessor :root

  def initialize
    @root ||= Node.new
  end

  def insert(word)
    return nil if word.empty?

    node = root
    word.split('').each do |char|
      node.children[char] = Node.new if node.children[char].nil?
      node = node.children[char]
    end
    node.end_of_word = true
  end

  def search(word)
    node = root

    word.split('').each do |char|
      return false if node.children[char].nil?

      node = node.children[char]
    end
    node
  end
end

private

class Node
  attr_accessor :children, :end_of_word
  
  def initialize
    @children = {}
    @end_of_word = false
  end
end
