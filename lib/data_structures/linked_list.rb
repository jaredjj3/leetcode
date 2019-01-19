# SESSION
# data_structures

# PROMPT
=begin

=end

class LinkedList
  class Node
    attr_reader :key
    attr_accessor :value, :next, :prev

    def initialize(key, value)
      @key = key
      @value = value
      @next = nil
      @prev = nil
    end
  end
end
