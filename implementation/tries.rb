
class TrieNode
  attr_accessor :root

  def initialize
    @root ||= Node.new
  end

  def insert(word)
    return nil if word.empty?

    node = root
    word.downcase.each_char do |char|
      node.children[char] = Node.new if node.children[char].nil?
      node = node.children[char]
    end
    node.end_of_word = true
  end

  def exists?(word)
    node = root

    word.downcase.each_char do |char|
      return false if node.children[char].nil?

      node = node.children[char]
    end
    node.end_of_word
  end

  def list_words(node = root, current_word = '', arr_words = [])
    return if node.nil?

    arr_words << current_word if node.end_of_word

    node.children.each do |char, char_node|
      list_words(char_node, current_word + char, arr_words)
    end

    arr_words
  end

  private

  class Node
    attr_accessor :children, :end_of_word
    
    def initialize
      @children = {}
      @end_of_word = false
    end
  end
end

