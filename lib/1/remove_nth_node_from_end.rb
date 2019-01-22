require_relative "../data_structures/data_structures.rb"

# SESSION
# 1

# PROMPT
=begin
Given a linked list, remove the n-th node from the end of list and return its head.

Example:

Given linked list: 1->2->3->4->5, and n = 2.

After removing the second node from the end, the linked list becomes 1->2->3->5.
Note:

Given n will always be valid.

Follow up:

Could you do this in one pass?
=end

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

def remove_nth_node_from_end(head, n)
  node = head
  prev = nil
  
  until n_from_end?(node, n)
    prev = node
    node = node.next
  end

  next_node = node.next
  prev.next = next_node unless prev.nil?
  node.next = nil

  head == node ? next_node : head
end

def n_from_end?(head, n)
  node = head

  n.times do
    return false if node.nil?
    node = node.next
  end

  node.nil?
end
