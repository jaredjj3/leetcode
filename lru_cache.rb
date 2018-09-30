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
    node.prev_node = self
  end

  def add_prev(node)
    self.prev_node = node
    node.next_node = self
  end

  def remove_next
    next_node.prev_node = nil
    self.next_node = nil
  end

  def remove_prev
    prev_node.next_node = nil
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
    return node if node.nil?


  end

  def put(key, value)
    node = Node.new(key, value)
    nodes[key] = node
    enqueue(node)
    dequeue if nodes.length > capacity
  end

  private

    def enqueue(node)
      if @head.nil?
        @head = node
        @tail = node
      else
        old_tail = @tail
        new_tail = node
        old_tail.add_prev(node)
        @tail = node
      end
    end

    def dequeue
      return if @head.nil?
      new_head = @head.prev_node
      old_head = @head

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

  describe "#put" do
    it "dequeues when used at capacity" do
      cache = LRUCache.new(2)
      cache.put(1, 1)
      assert_equal([1], cache.nodes.values.map(&:value))
      assert_head(1, cache)
      assert_tail(1, cache)

      cache.put(2, 2)
      assert_equal([1, 2], cache.nodes.values.map(&:value))
      assert_head(1, cache)
      assert_tail(2, cache)

      cache.put(3, 3)
      assert_equal([2, 3], cache.nodes.values.map(&:value))

      cache.put(4, 4)
      assert_equal([3, 4], cache.nodes.values.map(&:value))

      cache.put(5, 5)
      assert_equal([4, 5], cache.nodes.values.map(&:value))
    end
  end

  describe "#get" do
    it "returns nil when a key does not exist in the cache" do
      cache = LRUCache.new(1)
      assert_nil(cache.get(1))

      cache.put(1, 1)
      assert_nil(cache.get(2))

      cache.put(2, 2)
      assert_nil(cache.get(1))
    end
  end
end
