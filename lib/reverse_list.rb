require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Reverse a singly linked list.

Example:

Input: 1->2->3->4->5->NULL
Output: 5->4->3->2->1->NULL
Follow up:

A linked list can be reversed either iteratively or recursively. Could you implement both?
=end

class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

def reverse_list(head, prev = nil)
  return nil if head.nil?

  if head.next.nil?
    head.next = prev
    return head
  end

  new_head = reverse_list(head.next, head)
  head.next = prev

  new_head
end

describe "#reverse_list" do
  it "solves the problem prompt" do
    
  end
end
