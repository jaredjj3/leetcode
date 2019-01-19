# SESSION
# data_structures

class LinkedList
  class Node
    attr_reader :key
    attr_accessor :value, :next, :prev

    def initialize(key, value)
      @key = key
      @value = value
      @next = nil
      @prev = nil
    end
  end

  include Enumerable

  def initialize
    @head = Node.new(Object.new, nil)
    @tail = Node.new(Object.new, nil)
    connect(@head, @tail)
    @size = 0
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

  def include?(key)
    any? { |node| node.key == key }
  end

  def [](index)
    detect.with_index { |_node, ndx| ndx == index }
  end

  def insert(key, value)
    if include?(key)
      detect { |node| node.key == key }.value = value
    else
      node = Node.new(key, value)
      connect(last, node)
      connect(node, @tail)
      @size += 1
    end
  end

  def get(key)
    detect { |node| node.key == key }&.value
  end

  def remove(key)
    return unless include?(key)
    node = detect { |node| node.key == key }
    evict!(node)
    @size -= 1
  end

  def each(&blk)
    node = @head
    blk.call(node) until (node = node.next) == @tail
    self
  end

  private

    def connect(node1, node2)
      node1.next = node2
      node2.prev = node1
    end

    def evict!(node)
      connect(node.prev, node.next)
      node.prev = nil
      node.next = nil
    end
end
