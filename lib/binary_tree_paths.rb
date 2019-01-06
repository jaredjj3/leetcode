# PROMPT
=begin
Given a binary tree, return all root-to-leaf paths.

Note: A leaf is a node with no children.

Example:

Input:

   1
 /   \
2     3
 \
  5

Output: ["1->2->5", "1->3"]

Explanation: All root-to-leaf paths are: 1->2->5, 1->3
=end

# essentially implement dfs
def binary_tree_paths(root, vals = [])
  return [] if root.nil?
  return [(vals + [root.val]).join("->")] if root.left.nil? && root.right.nil?
  binary_tree_paths(root.left, vals + [root.val]) + binary_tree_paths(root.right, vals + [root.val])
end
