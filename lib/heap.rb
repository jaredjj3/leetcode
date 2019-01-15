require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Implement a heap data structure.

http://interactivepython.org/courselib/static/pythonds/Trees/BinaryHeapImplementation.html
=end

class Heap
  attr_reader :nodes, :size

  def self.left_index(index)
    2 * index
  end

  def self.right_index(index)
    2 * index + 1
  end

  def self.parent_index(index)
    index / 2
  end

  def initialize
    @nodes = [nil]
  end

  def insert(value)
    @nodes << value
    heapify_up!
  end

  def size
    @nodes.size - 1
  end

  def [](index)
    @nodes[index]
  end

  def peek
    @nodes[1]
  end

  def has_left?(index)
    Heap.left_index(index) < size
  end

  def has_right?(index)
    Heap.right_index(index) < size
  end

  def has_parent?(index)
    Heap.parent_index(index) > 0
  end

  def left(index)
    @nodes[Heap.left_index(index)]
  end

  def right(index)
    @nodes[Heap.right_index(index)]
  end

  def parent(index)
    @nodes[Heap.parent_index(index)]
  end

  private

    # Takes the last node and bubbles it up to where it will still
    # maintain the heap property. Should only be called from #insert
    def heapify_up!
      ndx = size - 1
      while has_parent?(ndx) && (parent(ndx) > self[ndx])
        swap!(ndx, Heap.parent_index(ndx))
        ndx = Heap.parent_index(ndx)
      end
    end

    def swap!(src_ndx, dst_ndx)
      @nodes[src_ndx], @nodes[dst_ndx] = @nodes[dst_ndx], @nodes[src_ndx]
    end
end

describe "Heap" do
  describe "::left_index" do
    it "returns 2 * index" do
      10.times do
        ndx = rand(1..100)
        exp = 2 * ndx
        assert_equal(exp, Heap.left_index(ndx))
      end
    end
  end

  describe "::right_index" do
    it "returns 2 * index + 1" do
      10.times do
        ndx = rand(1..100)
        exp = (2 * ndx) + 1
        assert_equal(exp, Heap.right_index(ndx))
      end
    end
  end

  describe "::parent_index" do
    it "returns index / 2" do
      10.times do
        ndx = rand(1..100)
        exp = ndx / 2
        assert_equal(exp, Heap.parent_index(ndx))
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

    it "adds the value to #nodes" do
      # Order agnostic comparison of expected and actual nodes
      def assert_nodes(exp, act)
        assert_nil(exp.first)
        assert_nil(act.first)
        nil_safe_sort = Proc.new { |x| x.nil? ? -Float::INFINITY : x }
        assert_equal(exp.sort_by(&nil_safe_sort), act.sort_by(&nil_safe_sort))
      end

      heap = Heap.new
      assert_nodes([nil], heap.nodes)

      heap.insert(42)
      assert_nodes([nil, 42], heap.nodes)

      heap.insert(42)
      assert_nodes([nil, 42, 42], heap.nodes)

      heap.insert(1)
      assert_nodes([nil, 42, 42, 1], heap.nodes)
    end

    it "maintains the heap property" do
      def valid_heap?(heap, index)
        node = heap[index]

        return true if node.nil?
        return false if heap.has_left?(index) && heap.left(index) <= node
        return false if heap.has_right?(index) && heap.right(index) <= node

        valid_heap?(heap, Heap.left_index(index)) && valid_heap?(heap, Heap.right_index(index))
      end

      def assert_valid_heap(heap)
        assert(valid_heap?(heap, 1), "#{heap.nodes.inspect} is not a valid heap")
      end

      heap = Heap.new
      assert_valid_heap(heap)

      [5, 1, 2, 3, 4, 5, 5, 2].shuffle.each do |node|
        heap.insert(node)
        assert_valid_heap(heap)
      end
    end
  end
end
