
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

  def list_words(node = root, current_word = '', arr_words = [])
    return if node.nil?

    if node.end_of_word
      arr_words << current_word
      current_word = ''
    end

    node.children.each do |char, char_node|
      p "This is char #{char} and this is char_node #{char_node}"
      list_words(char_node, current_word + char, arr_words)
    end

    arr_words
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
