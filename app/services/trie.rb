class Trie
  attr_accessor :root

  def initialize
    @root = TrieNode.new
  end

  def insert(word)
    current_node = @root
    word.each_char do |char|
      current_node.children[char] ||= TrieNode.new
      current_node = current_node.children[char]
    end
    current_node.is_end_of_word = true
  end

  def search_prefix(prefix)
    current_node = @root
    prefix.each_char do |char|
      return nil unless current_node.children[char]

      current_node = current_node.children[char]
    end
    current_node
  end

  def search(word)
    node = search_prefix(word)
    node&.is_end_of_word
  end

  def autocomplete(prefix)
    node = search_prefix(prefix)
    return [] unless node

    words = []
    dfs(node, prefix, words)
    words
  end

  private

  def dfs(node, prefix, words)
    words << prefix if node.is_end_of_word
    node.children.each do |char, child_node|
      dfs(child_node, prefix + char, words)
    end
  end
end

class TrieNode
  attr_accessor :children, :is_end_of_word

  def initialize
    @children = {}
    @is_end_of_word = false
  end
end
