require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Invert a binary tree.

Example:

Input:

     4
   /   \
  2     7
 / \   / \
1   3 6   9
Output:

     4
   /   \
  7     2
 / \   / \
9   6 3   1
=end

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

def invert_tree(root)
  return root if root.nil?

  tmp = root.right
  root.right = invert_tree(root.left)
  root.left = invert_tree(tmp)
  root
end

describe "#invert_tree" do
  it "solves the problem prompt" do
    flunk
  end
end
