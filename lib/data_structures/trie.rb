require_relative "../data_structures/data_structures.rb"

# SESSION
# data_structures

# PROMPT
=begin
Implement a trie with insert, search, and startsWith methods.

Example:

Trie trie = new Trie();

trie.insert("apple");
trie.search("apple");   // returns true
trie.search("app");     // returns false
trie.startsWith("app"); // returns true
trie.insert("app");
trie.search("app");     // returns true
Note:

You may assume that all inputs are consist of lowercase letters a-z.
All inputs are guaranteed to be non-empty strings.
=end

class Trie
  class Node
    attr_reader :value, :children

    def initialize(value)
      @value = value
      @children = {}
    end
  end

  def initialize
      @root = Node.new("")
  end

  def insert(word)
    node = @root
    word.each_char do |char|
      node = node.children.fetch(char) { node.children[char] = Node.new(char) }
    end
    node.children["*"] = nil
  end

  def search(word)
    node = @root
    word.chars.all? { |char| node = node.children[char] } && node.children.key?("*")
  end

  def starts_with(prefix)
    node = @root
    prefix.chars.all? { |char| node = node.children[char] }
  end
end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)
