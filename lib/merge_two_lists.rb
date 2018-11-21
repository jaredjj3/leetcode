require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

Example:

Input: 1->2->4, 1->3->4
Output: 1->1->2->3->4->4
=end

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end
def merge_two_lists(l1, l2)
  return nil if l1.nil? && l2.nil?
  return l1 if l1 && l2.nil?
  return l2 if l2 && l1.nil?

  if l1.val <= l2.val
    merged = l1
    curr_l1 = l1.next
    curr_l2 = l2
  else
    merged = l2
    curr_l1 = l1
    curr_l2 = l2.next
  end

  curr_merged = merged
  while curr_l1 || curr_l2
    if curr_l1.nil?
      curr_merged.next = curr_l2
      curr_merged = curr_l2
      curr_l2 = curr_l2.next
    elsif curr_l2.nil?
      curr_merged.next = curr_l1
      curr_merged = curr_l1
      curr_l1 = curr_l1.next
    else
      if curr_l1.val <= curr_l2.val
        curr_merged.next = curr_l1
        curr_merged = curr_l1
        curr_l1 = curr_l1.next
      else
        curr_merged.next = curr_l2
        curr_merged = curr_l2
        curr_l2 = curr_l2.next
      end
    end
  end

  merged
end
