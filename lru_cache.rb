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
  attr_accessor :key, :value, :next_node, :prev_node

  def initialize(key, value)
    @key = key
    @value = value
    @next_node = nil
    @prev_node = nil
  end

  def add_next(node)
    self.next_node = node
    node.prev_node = self unless node.nil?
  end

  def add_prev(node)
    self.prev_node = node
    node.next_node = self unless node.nil?
  end

  def remove_next
    next_node.prev_node = nil unless next_node.nil?
    self.next_node = nil
  end

  def remove_prev
    prev_node.next_node = nil unless prev_node.nil?
    self.prev_node = nil
  end
end

class LRUCache
  attr_accessor :nodes, :capacity, :head, :tail

  def initialize(capacity)
    @nodes = {}
    @capacity = capacity
    @head = nil
    @tail = nil
  end

  def get(key)
    node = nodes[key]
    return -1 if node.nil?
    
    prev_node = node.prev_node
    next_node = node.next_node

    dequeue if node == @head

    node.remove_next
    node.remove_prev

    prev_node.add_next(next_node) unless prev_node.nil?
    next_node.add_prev(prev_node) unless next_node.nil?

    enqueue(node)

    node.value
  end

  def put(key, value)
    node = Node.new(key, value)
    dequeue if values.length + (nodes.include?(key) ? 0 : 1)  > capacity
    enqueue(node)
  end

  def values
    arr = []
    node = @tail

    until node.nil?
      arr << node.value
      node = node.next_node
    end

    arr
  end

  private

    def enqueue(node)
      nodes[node.key] = node

      if @head.nil?
        @head = node
        @tail = node
      else
        old_tail = @tail
        new_tail = node

        old_tail.add_prev(new_tail)
        new_tail.add_next(old_tail)
        new_tail.remove_prev

        @tail = new_tail
      end
    end

    def dequeue
      return if @head.nil?

      new_head = @head.prev_node
      old_head = @head

      new_head.remove_next unless new_head.nil?

      old_head.remove_prev
      old_head.remove_next

      nodes.delete(old_head.key)

      @head = new_head
    end
end

describe "LRUCache" do
  def assert_head(value, cache)
    assert_equal(value, cache.head.value, "Expected head to be #{value}")
  end

  def assert_tail(value, cache)
    assert_equal(value, cache.tail.value, "Expected tail to be #{value}")
  end
  
  it "solves the problem prompt" do
    cache = LRUCache.new(2)

    cache.put(1, 1)
    cache.put(2, 2)
    assert_equal([2, 1], cache.values)
    assert_head(1, cache)
    assert_tail(2, cache)

    assert_equal(1, cache.get(1))
    assert_head(2, cache)
    assert_tail(1, cache)

    cache.put(3, 3)
    assert_equal([3, 1], cache.values)
  end

  it "solves the problem prompt" do
    cache = LRUCache.new(2)

    cache.put(2, 1)
    assert_equal([1], cache.values)
    assert_head(1, cache)
    assert_tail(1, cache)

    cache.put(1, 1)
    assert_equal([1, 1], cache.values)
    assert_tail(1, cache)
    assert_head(1, cache)
    assert_equal([1, 2], cache.nodes.keys.sort)

    cache.put(2, 3)
    assert_equal([3, 1], cache.values)
    assert_equal([1, 2], cache.nodes.keys.sort)
    assert_head(1, cache)
    assert_tail(3, cache)

    cache.put(4, 1)
    assert_equal([1, 3], cache.values)
    assert_equal([2, 4], cache.nodes.keys.sort)

    assert_equal(-1, cache.get(1))
    assert_equal([1, 3], cache.values)
    assert_equal(3, cache.get(2))
  end

  describe "#put" do
    it "dequeues when used at capacity" do
      cache = LRUCache.new(2)
      cache.put(1, 1)
      assert_equal([1], cache.values)
      assert_head(1, cache)
      assert_tail(1, cache)

      cache.put(2, 2)
      assert_equal([2, 1], cache.values)
      assert_head(1, cache)
      assert_tail(2, cache)

      cache.put(3, 3)
      assert_equal([3, 2], cache.values)

      cache.put(4, 4)
      assert_equal([4, 3], cache.values)

      cache.put(5, 5)
      assert_equal([5, 4], cache.values)
    end
  end

  describe "#get" do
    it "returns -1 when a key does not exist in the cache" do
      cache = LRUCache.new(1)
      assert_equal(-1, cache.get(1))

      cache.put(1, 1)
      assert_equal(-1, cache.get(2))

      cache.put(2, 2)
      assert_equal(-1, cache.get(1))
    end

    it "moves the key-value pair to the tail" do
      cache = LRUCache.new(3)

      cache.put(1, 1)
      cache.put(2, 2)
      cache.put(3, 3)
      assert_equal([3, 2, 1], cache.values)

      assert_equal(2, cache.get(2))
      assert_equal([2, 3, 1], cache.values)
    end
  end
end
