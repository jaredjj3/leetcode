require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.

get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.

Follow up:
Could you do both operations in O(1) time complexity?

Example:

LRUCache cache = new LRUCache( 2 /* capacity */ );

cache.put(1, 1);
cache.put(2, 2);
cache.get(1);       // returns 1
cache.put(3, 3);    // evicts key 2
cache.get(2);       // returns -1 (not found)
cache.put(4, 4);    // evicts key 1
cache.get(1);       // returns -1 (not found)
cache.get(3);       // returns 3
cache.get(4);       // returns 4
=end

class Node
  attr_accessor :key, :value, :next, :prev

  def initialize(key, value)
    @key = key
    @value = value
    @next = nil
    @prev = nil
  end
end

class LRUCache
  attr_accessor :capacity, :nodes

  def initialize(capacity)
    @capacity = capacity
    @nodes = {}
    @head = nil
  end

  def get(key)
    node = @nodes[key]
    return -1 if node.nil?
    requeue!(node)
    node.value
  end

  def put(key, value)
    node = @nodes[key] || Node.new(key, value)
    node.value = value

    prev_node = node.prev
    next_node = node.next
    prev_node.next = next_node unless prev_node.nil?
    next_node.prev = prev_node unless next_node.nil?

    unless node == @head
      node.next = @head
      @head.prev = node unless @head.nil?
      @head = node
    end

    node.prev = nil

    @nodes[key] = node
    trim! if @nodes.size > @capacity
  end

  def values
    nodes = []
    node = @head

    while node
      nodes << node
      node = node.next
    end

    nodes.map(&:value)
  end

  private

    def tail
      node = @head
      return nil if node.nil?
      node = node.next until node.next.nil?
      node
    end

    def trim!
      probe = tail

      unless probe.nil?
        prev_node = probe.prev
        probe.prev = nil
        prev_node.next = nil unless prev_node.nil?

        @nodes.delete(probe.key)
      end
    end

    def requeue!(node)
      prev_node = node.prev
      next_node = node.next
      prev_node.next = next_node unless prev_node.nil?
      next_node.prev = prev_node unless next_node.nil?

      node.prev = nil
      node.next = @head unless node == @head
      @head.prev = node
      @head = node
    end
end

describe "LRUCache" do
  it "solves the problem prompt" do
    cache = LRUCache.new(2)

    assert_equal([], cache.values)

    cache.put(1, 1)
    assert_equal([1], cache.values)

    cache.put(2, 2)
    assert_equal([2, 1], cache.values)

    assert_equal(1, cache.get(1))
    assert_equal([1, 2], cache.values)

    cache.put(3, 3)
    assert_equal([3, 1], cache.values)

    assert_equal(-1, cache.get(2))
    assert_equal([3, 1], cache.values)

    cache.put(4, 4)
    assert_equal([4, 3], cache.values)

    assert_equal(-1, cache.get(1))
    assert_equal([4, 3], cache.values)

    assert_equal(3, cache.get(3))
    assert_equal([3, 4], cache.values)

    assert_equal(4, cache.get(4))
    assert_equal([4, 3], cache.values)
  end

  it "solves failing tests" do
    cache = LRUCache.new(1)

    cache.put(2, 1)
    assert_equal([1], cache.values)

    assert_equal(1, cache.get(2))

    cache.put(3, 2)
    assert_equal([2], cache.values)
  end

  it "solves failing tests" do
    cache = LRUCache.new(2)

    cache.put(2, 1)
    assert_equal([1], cache.values)

    cache.put(2, 2)
    assert_equal([2], cache.values)
  end

  describe "#get" do
    it "returns -1 if the key does not exist" do
      assert_equal(-1, LRUCache.new(1).get(1))
    end

    it "requeues the fetched node" do
      cache = LRUCache.new(2)
      
      cache.put(1, 1)
      cache.put(2, 2)

      assert_equal([2, 1], cache.values)
      
      assert_equal(1, cache.get(1))

      assert_equal([1, 2], cache.values)
    end
  end

  describe "#put" do
    it "enqueues nodes by least recently used" do
      cache = LRUCache.new(3)

      cache.put(1, 1)
      assert_equal([1], cache.values)

      cache.put(2, 2)
      assert_equal([2, 1], cache.values)
      
      cache.put(3, 3)
      assert_equal([3, 2, 1], cache.values)
    end

    it "trims when capacity is reached" do
      cache = LRUCache.new(2)

      cache.put(1, 1)
      assert_equal([1], cache.values)

      cache.put(2, 2)
      assert_equal([2, 1], cache.values)
      
      cache.put(3, 3)
      assert_equal([3, 2], cache.values)
    end
  end
end
