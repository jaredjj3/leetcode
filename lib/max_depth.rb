require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given a binary tree, find its maximum depth.

The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

Note: A leaf is a node with no children.

Example:

Given binary tree [3,9,20,null,null,15,7],

    3
   / \
  9  20
    /  \
   15   7
return its depth = 3.
=end

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

def max_depth(root, depth = 0)
  return depth if root.nil?
  [max_depth(root.left, depth + 1), max_depth(root.right, depth + 1)].max
end
