require "minitest/autorun"
require "byebug"

# PROMPT
=begin
CTIC pg. 94

implement an algorithm to find the kth to last element of a singly linked list
=end

class Node
  attr_accessor :next, :data
  attr_reader :data

  def initialize(data)
    self.data = data
  end
end

def kth_to_last(head, k)
  return nil if k == 0

  len = 0
  node = head

  until node.nil?
    len += 1
    node = node.next
  end

  return nil if k >= len

  ndx = 0
  node = head
  until ndx == (len - k)
    ndx += 1
    node = node.next
  end

  node.data
end

def to_list(arr)
  return nil if arr.empty?

  node = head = Node.new(arr.first)

  arr[1..-1].each do |data|
    node.next = Node.new(data)
    node = node.next
  end

  head
end

def to_a(head)
  return [] if head.nil?

  node = head
  arr = []

  until node.nil?
    arr << node.data
    node = node.next
  end

  arr
end

describe "#kth_to_last" do
  def assert_kth_to_last(arr, k)
    head = to_list(arr)

    result = kth_to_last(head, k)
    expected = arr[-k]

    if expected.nil?
      assert_nil(result)
    else
      assert_equal(expected, result)
    end
  end

  it "finds the kth to last element" do
    assert_kth_to_last([1, 2, 3, 4], 2)
    assert_kth_to_last([4, 4, 4, 4], 3)
    assert_kth_to_last([4, 4, 2, 4], 1)
  end

  it "returns nil if k is greater than the element size" do
    assert_kth_to_last([1], 2)
    assert_kth_to_last([], 1)
  end

  it "returns nil if k is equal to 0" do
    assert_nil(kth_to_last([1, 2, 3, 4], 0))
    assert_nil(kth_to_last([], 0))
  end
end
