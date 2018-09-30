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
end

class LRUCache
  attr_accessor :nodes, :capacity

  def initialize(capacity)
    @nodes = {}
    @capacity = capacity
    @head = nil
    @tail = nil
  end

  def get(key)
  end

  def put(key, value)
    node = Node.new(key, value)
    nodes[key] = node

    prune if nodes.length > capacity

    @head = node if @head.nil?
    @tail = node if @tail.nil?
  end

  def prune
    return if @head.nil?

    node = @head
    prev_node = node.prev_node
    
    node.prev_node = nil
    @nodes.delete(node.key)

    @head = prev_node
  end
end



describe "LRUCache" do
  it "prunes when #put is used at capacity" do
    cache = LRUCache.new(2)
    cache.put(1, 1)
    assert_equal([1], cache.nodes.values.map(&:value))

    cache.put(2, 2)
    assert_equal([1, 2], cache.nodes.values.map(&:value).sort)

    cache.put(3, 3)
    assert_equal([2, 3], cache.nodes.values.map(&:value).sort)
  end
end
