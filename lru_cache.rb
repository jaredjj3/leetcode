require "minitest/autorun"

# Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.

# get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
# put(key, value) - Set or insert the value if the key is not already present. When the cache
# reached its capacity, it should invalidate the least recently used item before inserting a new item.

# Follow up:
# Could you do both operations in O(1) time complexity?

class Node
  attr_accessor :value, :next, :prev
  def initialize(value)
    @value = value
    @next = nil
    @prev = nil
  end

  def add_next(next_node)
    @next = next_node
    next_node.prev = self unless next_node.nil?
    
    true
  end

  def add_prev(prev_node)
    @prev = prev_node
    prev_node.next = self unless prev_node.nil?

    true
  end

  def remove_prev
    add_prev(nil)
  end

  def remove_next
    add_next(nil)
  end
end

class LRUCache
  attr_accessor :capacity, :head, :tail, :keys

  def initialize(capacity)
    @capacity = capacity
    @tail = nil
    @keys = {}
  end

  def get(key)
    node = keys[key]
    return -1 if node.nil?

    most_recently_used!(node)

    node.value
  end

  def put(key, value)
    node = Node.new(value)
    keys[key] = node

    enqueue(node)

    dequeue if count > capacity
  end

  def count
    return 0 if tail.nil?
    
    node = tail
    num = 1
    num += 1 until (node = node.next).nil?
    num
  end

  def head
    return nil if tail.nil?

    node = tail
    node = node.next until node.next.nil?
    node
  end

  private

    def enqueue(node)
      @tail.add_prev(node) unless tail.nil?
      @tail = node
    end

    def dequeue
      head = head()
      head.remove_prev unless head.nil?
    end

    def most_recently_used!(node)
      return if tail.nil?

      next_node = node.next
      prev_node = node.prev

      node.remove_prev
      node.remove_next

      next_node.add_prev(prev_node) unless next_node.nil?
      prev_node.add_next(next_node) unless prev_node.nil?

      enqueue(node)
    end
end

# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache.new(capacity)
# param_1 = obj.get(key)
# obj.put(key, value)

describe "LRUCache" do
  it "works" do
    cache = LRUCache.new(2)
    cache.put(1, 1);                # [(1, 1)]
    assert_equal(1, cache.count)
    cache.put(2, 2);                # [(2, 2), (1, 1)]
    assert_equal(2, cache.count)
    assert_equal(1, cache.get(1));  # [(1, 1), (2, 2)]
    cache.put(3, 3);                # [(3, 3), (1, 1)]
    assert_equal(-1, cache.get(2)); # [(3, 3), (1, 1)]
    cache.put(4, 4);                # [(4, 4), (3, 3)]
    assert_equal(-1, cache.get(1)); # [(4, 4), (3, 3)]
    assert_equal(3, cache.get(3));  # [(3, 3), (4, 4)]
    assert_equal(4, cache.get(4));  # [(4, 4), (3, 3)]
  end
end
