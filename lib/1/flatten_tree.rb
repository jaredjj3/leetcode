require_relative "../data_structures/data_structures.rb"

# SESSION
# 1

# PROMPT
=begin
Given a binary tree, flatten it to a linked list in-place.

For example, given the following tree:

    1
   / \
  2   5
 / \   \
3   4   6
The flattened tree should look like:

1
 \
  2
   \
    3
     \
      4
       \
        5
         \
          6
=end

def flatten_tree(root, prev = nil)
  return root if root.nil?

  flatten_tree(root.left)
  flatten_tree(root.right)

  tmp = root.right

  unless root.left.nil?
    root.right = root.left
    root.left = nil
    root = root.right until root.right.nil?
    root.right = tmp
  end

  root
end
