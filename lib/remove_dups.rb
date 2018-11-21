require "minitest/autorun"
require "byebug"
require "set"

# PROMPT
=begin
CTIC:
Write code to remove duplicates from an unsorted linked list
=end

class Node
  attr_accessor :next, :data

  def initialize(data)
    self.data = data
  end
end

def remove_dups(head)
  seen = Set.new
  node = Node.new(nil) # dummy
  node.next = head

  until node.nil?
    if !node.next.nil? && seen.add?(node.next.data).nil?
      node.next = node.next.next
    else
      node = node.next
    end
  end

  head
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

describe "#remove_dups" do
  def assert_remove_dups(arr)
    head = to_list(arr)
    # we assume that Array#uniq works by iterating over the elements in order
    assert_equal(arr.uniq, to_a(remove_dups(head)))
  end

  it "removes duplicates at the end" do
    assert_remove_dups([1, 6, 2, 4, 4])
  end

  it "removes duplicates from the front" do
    assert_remove_dups([1, 1, 2, 4, 4])
  end

  it "removes duplicates from the middle" do
    assert_remove_dups([1, 4, 4, 7, 1])
  end

  it "removes duplicates from the middle" do
    assert_remove_dups([1, 4, 4, 7, 1])
  end

  it "removes multiple duplicates" do
    assert_remove_dups([6, 1, 6, 2, 4, 4])
    assert_remove_dups([6, 6, 6, 4, 4, 4])
    assert_remove_dups([4, 4, 4, 4, 4, 4])
  end

  it "does not remove duplicates if there aren't any" do
    assert_remove_dups([1, 6, 2, 4])
  end
end
