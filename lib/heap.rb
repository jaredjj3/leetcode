require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Implement a heap data structure.

http://interactivepython.org/courselib/static/pythonds/Trees/BinaryHeapImplementation.html
=end

class Heap
  attr_reader :nodes, :size

  def self.left(index, nodes)
    nodes[2 * index]
  end

  def self.right(index, nodes)
    nodes[(2 * index) + 1]
  end

  def self.parent(index, nodes)
    nodes[index / 2]
  end

  def initialize
    @nodes = [nil]
    @size = 0
  end

  def insert(value)
    @size += 1
  end

  private

    # Takes the last node and bubbles it up to where it will still
    # maintain the heap property. Should only be called from #insert
    def heapify_up!
    end
end

describe "Heap" do
  describe "::left" do
    it "returns the node at 2 * index" do
      nodes = [nil, *1..10]
      (1...nodes.size).each do |ndx|
        exp = 2 * ndx
        if exp > nodes.size - 1
          assert_nil(Heap.left(ndx, nodes))
        else
          assert_equal(exp, Heap.left(ndx, nodes))
        end
      end
    end
  end

  describe "::right" do
    it "returns the node at 2 * index" do
      nodes = [nil, *1..10]
      (1...nodes.size).each do |ndx|
        exp = (2 * ndx) + 1
        if exp > nodes.size - 1
          assert_nil(Heap.right(ndx, nodes))
        else
          assert_equal(exp, Heap.right(ndx, nodes))
        end
      end
    end
  end

  describe "::parent" do
    it "returns the node at index / 2" do
      nodes = [nil, *1..10]
      (1...nodes.size).each do |ndx|
        exp = ndx / 2
        if exp == 0
          assert_nil(Heap.parent(ndx, nodes))
        else
          assert_equal(exp, Heap.parent(ndx, nodes))
        end
      end
    end
  end

  describe "#initialize" do
    it "initializes #nodes to be an array with 1 nil element" do
      assert_equal([nil], Heap.new.nodes)
    end

    it "initializes #size to be 0" do
      assert_equal(0, Heap.new.size)
    end
  end

  describe "#insert" do
    it "increments #size by 1" do
      heap = Heap.new
      assert_equal(0, heap.size)

      heap.insert(1)
      assert_equal(1, heap.size)

      heap.insert(1)
      assert_equal(2, heap.size)

      heap.insert(10)
      assert_equal(3, heap.size)
    end
  end
end
