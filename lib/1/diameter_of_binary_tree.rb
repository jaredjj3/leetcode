require_relative "../data_structures/data_structures.rb"

# SESSION
# 1

# PROMPT
=begin
Given a binary tree, you need to compute the length of the diameter of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

Example:
Given a binary tree 
          1
         / \
        2   3
       / \     
      4   5    
Return 3, which is the length of the path [4,2,1,3] or [5,2,1,3].

Note: The length of path between two nodes is represented by the number of edges between them.
=end

LeetCode
Explore
Problems
Mock 
Contest
Articles
Discuss
 Store 
New Playground
jaredjj3
Diameter of Binary Tree
Submission Detail
106 / 106 test cases passed.
Status: Accepted
Runtime: 68 ms
Submitted: 0 minutes ago
Accepted Solutions Runtime Distribution
010020030040050060070001020304050607080
ruby
You are here! 
Your runtime beats 22.22 % of ruby submissions.
Runtime (ms)Distribution (%)

01002003004005006007000255075
Zoom area by dragging across this chart
Invite friends to challenge Diameter of Binary Tree
Submitted Code: 0 minutes ago
Language: ruby


Back to problem
× Close
sample 56 ms submission
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def diameter_of_binary_tree(root)
    @max = 0
    depth(root)
    return @max
end

def depth(root)
    return 0 if root.nil?
    
    l, r = depth(root.left), depth(root.right)
    @max = [l + r, @max].max
   return 1 + [l, r].max 
end

# def diameter_of_binary_tree(root, max = 0, depths = { nil => 0 })
#   return 0 if root.nil?
  
#   left = depths.fetch(root.left) { depths[root.left] = depth(root.left)  }
#   right = depths.fetch(root.right) { depths[root.right] = depth(root.right) }

#   diameters = [max]
#   diameters << left + right
#   diameters << diameter_of_binary_tree(root.left, max, depths)
#   diameters << diameter_of_binary_tree(root.right, max, depths)
#   diameters.max
# end

# def depth(root)
#   return 0 if root.nil?

#   left = depth(root.left)
#   right = depth(root.right)

#   1 + [left, right].max
# end
