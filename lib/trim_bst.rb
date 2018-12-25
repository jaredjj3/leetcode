require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given a binary search tree and the lowest and highest boundaries as L and R, trim the tree so that
all its elements lies in [L, R] (R >= L). You might need to change the root of the tree,
so the result should return the new root of the trimmed binary search tree.

Example 1:
Input: 
    1
   / \
  0   2

  L = 1
  R = 2

Output: 
    1
      \
       2
Example 2:
Input: 
    3
   / \
  0   4
   \
    2
   /
  1

  L = 1
  R = 3

Output: 
      3
     / 
   2   
  /
 1
=end

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @param {Integer} l
# @param {Integer} r
# @return {TreeNode}
def trim_bst(root, l, r)
  if node.nil?
    return
  elsif node.val < l
    trim_bst(node.right)
  elsif node.val > r
    trim_bst(node.left)
  else
    node.left = trim_bst(node.left)
    node.right = trim_bst(node.right)
    node
  end
end

describe "#trim_bst" do
  it "solves the problem prompt" do
    flunk
  end
end
