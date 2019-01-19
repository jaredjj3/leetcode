require_relative "../data_structures/data_structures.rb"

# SESSION
# data_structures

class Tree
  class Node
    attr_accessor :value, :left, :right

    def initialize(key, value)
      @value = value
      @left = nil
      @right = nil
    end
  end
end
