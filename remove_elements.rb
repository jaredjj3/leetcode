require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Remove all elements from a linked list of integers that have value val.

Example:

Input:  1->2->6->3->4->5->6, val = 6
Output: 1->2->3->4->5
=end

def remove_elements(head, val)
end

class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
  end
end

describe "#remove_elements" do
  def map_vals(head)
    arr = []
    curr = head

    while curr
      arr << curr.val
      curr = curr.next
    end

    arr
  end

  def assert_reject(nums, val)
    nodes = nums.map(&ListNode.method(:new))
    head, *rest = nodes
    nodes.each.with_index { |node, ndx| node.next = nodes[ndx + 1] }

    assert_equal(nums.reject { |num| num == val }, map_vals(head))
  end

  it "removes all the elements whose val is equal to the argument val" do
    arr = [1, 2, 2, 2, 3, 4, 6, 5, 1, 5]
    arr.uniq.each { |el| assert_reject(arr, el) }
  end
end
