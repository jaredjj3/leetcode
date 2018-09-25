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
  node1 = l1
  node2 = l2
  curr_sum_node = nil
  result = nil
  carry_one = false

  until node1.nil? || node2.nil?
    set_carry_one_to = false
    next_val = node1.val + node2.val + (carry_one ? 1 : 0)

    if next_val >= 10
      set_carry_one_to = true
      next_val = next_val.to_s.chars[1].to_i
    end

    next_val_node = ListNode.new(next_val)
    result ||= next_val_node

    if curr_sum_node.nil?
      curr_sum_node = next_val_node
    else
      curr_sum_node.next = next_val_node
      curr_sum_node = next_val_node
    end

    node1 = node1.next
    node2 = node2.next

    carry_one = set_carry_one_to
  end

  result
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

    result = add_two_numbers(l1, l2)
    [7, 0, 8].each do |expected_val|
      assert_equal(expected_val, result.val)
      result = result.next
    end

    assert_nil(result)
  end
end
