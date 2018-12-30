require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given a non-empty binary tree, return the average value of the nodes on each level in the form of an array.
Example 1:
Input:
    3
   / \
  9  20
    /  \
   15   7
Output: [3, 14.5, 11]
Explanation:
The average value of nodes on level 0 is 3,  on level 1 is 14.5, and on level 2 is 11. Hence return [3, 14.5, 11].
Note:
The range of node's value is in the range of 32-bit signed integer.
=end

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

def average_of_levels(root)
  bfs(root) { |nodes| nodes.map(&:val).reduce(&:+) / nodes.size.to_f }
end

def bfs(root, &blk)
  queue = []
  res = []

  queue << root unless root.nil?

  until queue.empty?
    nodes = []
    nodes << queue.pop until queue.empty?
    res << blk.call(nodes)
    nodes.each do |node|
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end
  end

  res
end

describe "#average_of_levels" do
  it "solves the problem prompt" do
    flunk
  end
end
