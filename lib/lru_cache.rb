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
  attr_accessor :key, :value, :prev, :next

  def initialize(key, value)
    @key = key
    @value = value
    @prev = nil
    @next = nil
  end
end

class LRUCache
  attr_accessor :capacity, :map, :nodes

  def initialize(capacity)
    @map = {}
    @head = nil
    @capacity = capacity
  end

  def values
    values = []
    curr = @head
    
    until curr.nil?
      values.push(curr.value)
      curr = curr.next
    end
    
    values
  end

  def get(key)
    node = @map[key]
    return -1 if node.nil?
    requeue!(key)
    node.value
  end

  def put(key, value)
    unless @map[key].nil?
      @map[key]
    end

    evict! if @nodes.size > capacity
  end

  private

    def evict!
      node = @nodes.pop
      map.delete(node.key)
    end

    def requeue!(key)
      node = @map[key]
      @nodes.reject! { |n| n == node }
      @nodes.unshift(node)
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
