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

class LinkedList
  class Node
    attr_accessor :key, :value, :prev, :next

    def initialize(key = nil, value = nil)
      @key = key
      @value = value
      @prev = nil
      @next = nil
    end
  end

  attr_reader :size

  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @size = 0

    @head.next = @tail
    @tail.prev = @head
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def each(&blk)
    node = @head.next
    until node == @tail
      blk.call(node)
      node = node.next
    end

    self
  end

  def [](index)
    detect.with_index { |node, ndx| ndx == index }
  end

  def get(key)
    detect { |node| node.key == key }
  end

  def key?(key)
    any? { |node| node.key == key }
  end

  def append(key, value)
    if key?(key)
      node = get(key)
      node.value = value
    else
      node = Node.new(key, value)
      connect(last, node)
      connect(node, @tail)
      @size += 1
    end

    node
  end

  def remove(key)
    return unless key?(key)
    node = get(key)
    connect(node.prev, node.next)
    @size -= 1
    node
  end

  private

    # Connects nodes from prev => next
    def connect(src_node, dst_node)
      src_node.next = dst_node
      dst_node.prev = src_node
    end
end

class LRUCache
  attr_reader :size

  def initialize(size)
    @size = size
    @list = LinkedList.new
    @nodes = {}
  end

  def get(key)
    return -1 unless @nodes.key?(key)
    requeue!(key)
    @nodes[key].value
  end

  def put(key, value)
    if @nodes.key?(key)
      @nodes[key].value = value
      requeue!(key)
    else
      node = @list.append(key, value)
      @nodes[key] = node
    end

    evict! if @list.size > @size
  end

  def values
    @list.to_a.map(&:value).reverse
  end

  private

    def requeue!(key)
      node = @list.remove(key)
      new_node = @list.append(key, node.value)
      @nodes[key] = new_node
      new_node
    end

    def evict!
      node = @list.first
      return if node.nil?
      @list.remove(node.key)
      @nodes.delete(node.key)
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
