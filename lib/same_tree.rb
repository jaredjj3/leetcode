require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given two binary trees, write a function to check if they are the same or not.

Two binary trees are considered the same if they are structurally identical and the nodes have the same value.

Example 1:

Input:     1         1
          / \       / \
         2   3     2   3

        [1,2,3],   [1,2,3]

Output: true
Example 2:

Input:     1         1
          /           \
         2             2

        [1,2],     [1,null,2]

Output: false
Example 3:

Input:     1         1
          / \       / \
         2   1     1   2

        [1,2,1],   [1,1,2]

Output: false
=end

def same_tree(p, q)
  return true if p.nil? && q.nil?
  return false if (p.nil? ^ q.nil?) || p.val != q.val
  same_tree(p.left, q.left) && same_tree(p.right, q.right)
end

describe "#same_tree" do
  it "solves the problem prompt" do
    flunk
  end
end
