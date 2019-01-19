require "minitest/autorun"
require_relative "../../lib/data_structures/heap.rb"

# SESSION
# data_structures

describe "Heap" do
  def valid_heap?(heap, index)
    node = heap[index]

    return true if node.nil?
    return false if heap.has_left?(index) && heap.left(index) < node
    return false if heap.has_right?(index) && heap.right(index) < node

    valid_heap?(heap, Heap.left_index(index)) && valid_heap?(heap, Heap.right_index(index))
  end

  def assert_valid_heap(heap)
    assert(valid_heap?(heap, 1), "#{heap.nodes.inspect} is not a valid heap")
  end

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
      heap = Heap.new
      assert_valid_heap(heap)

      [5, 1, 2, 3, 4, 5, 5, 2].shuffle.each do |node|
        heap.insert(node)
        assert_valid_heap(heap)
      end
    end
  end

  describe "#poll" do
    it "removes the minimum node and re-heapifies" do
      heap = Heap.new
      nodes = [*1..10]
      nodes.each { |node| heap.insert(node) }

      nodes.each do |node|
        assert_equal(node, heap.poll)
        assert_valid_heap(heap)
      end
    end

    it "returns nil for a heap of size 0" do
      heap = Heap.new

      assert_nil(heap.poll)
      assert_equal([nil], heap.nodes)
    end
  end
end
