require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Implement a heap data structure.

http://interactivepython.org/courselib/static/pythonds/Trees/BinaryHeapImplementation.html
=end

class Heap
  attr_reader :nodes

  def initialize
    @nodes = [nil]
  end
end

describe "Heap" do
  describe "#initialize" do
    it "initializes #nodes to be an array with 1 nil element" do
      assert_equal([nil], Heap.new.nodes)
    end

    it "initializes #size to be 0" do
      assert_equal(0, Heap.new.size)
    end
  end
end
