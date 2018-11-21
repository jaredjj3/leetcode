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
  dummy = ListNode.new(0)
  dummy.next = head

  curr = dummy
  while curr.next
    if curr.next.val == val
      curr.next = curr.next.next
    else
      curr = curr.next
    end
  end

  dummy.next
end

class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
  end
end

def map_vals(head)
  arr = []
  curr = head

  while curr
    arr << curr.val
    curr = curr.next
  end

  arr
end

def link_nodes!(nodes)
  nodes.each.with_index { |node, ndx| node.next = nodes[ndx + 1] }
end

def assert_reject(nums, val)
  nodes = nums.map(&ListNode.method(:new))
  head, *rest = nodes

  link_nodes!(nodes)
  new_head = remove_elements(head, val)

  assert_equal(nums.reject { |num| num == val }, map_vals(new_head))
end

describe "#remove_elements" do
  it "removes all the elements whose val is equal to the argument val" do
    arr = [1, 2, 2, 2, 3, 4, 6, 5, 1, 5]
    arr.uniq.each { |el| assert_reject(arr, el) }
  end
end
