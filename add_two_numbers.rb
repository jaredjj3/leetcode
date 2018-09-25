require "minitest/autorun"

# You are given two non-empty linked lists representing two non-negative integers.
# The digits are stored in reverse order and each of their nodes contain a single digit.
# Add the two numbers and return it as a linked list.
# You may assume the two numbers do not contain any leading zero, except the number 0 itself.
# Example:
# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8
# Explanation: 342 + 465 = 807.

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  []
end

describe "#add_two_numbers" do
  def linked_list(vals)
    vals.each.with_object([]).with_index do |(val, nodes), ndx|
      node = ListNode.new(val)
      prev_node = nodes[ndx - 1]
      prev_node.next = node unless prev_node.nil?
      nodes << node
    end
  end

  it "solves the problem prompt" do
    l1 = linked_list([2, 4, 3]).first
    l2 = linked_list([5, 6, 4]).first
    assert_equal([7, 0, 8], add_two_numbers(l1, l2).map(&:val))
  end
end
