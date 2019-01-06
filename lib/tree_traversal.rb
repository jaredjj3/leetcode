require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Implement an in order traversal search.
=end

class Node
  attr_accessor :data, :children

  def initialize(data)
    self.data = data
    self.children = []
  end
end

def in_order_traversal(root)
  return [root] if root.children.none?
  in_order_traversal(root.children[0]) + [root] + in_order_traversal(root.children[-1])
end

def pre_order_traversal(root)
  return [root] if root.children.none?
  [root] + pre_order_traversal(root.children[0]) + pre_order_traversal(root.children[-1])
end

def post_order_traversal(root)
  return [root] if root.children.none?
  post_order_traversal(root.children[0]) + post_order_traversal(root.children[-1]) + [root]
end

def bfs(root)
  nodes = [root]
  visited = []

  until nodes.empty?
    node = nodes.shift
    nodes += node.children
    visited << node
  end

  visited
end

def tree
#     a
#    /  \
#   b    c
# /   \ /  \
# d   e f   g
  a, b, c, d, e, f, g = ("a".."g").map { |data| Node.new(data) }
  a.children = [b, c]
  b.children = [d, e]
  c.children = [f, g]

  [a, b, c, d, e, f, g]
end

describe "#in_order_traversal" do
  it "iterates through the tree inorder" do
    a, b, c, d, e, f, g = tree

    assert_equal([d, b, e, a, f, c, g].map(&:data), in_order_traversal(a).map(&:data))
    assert_equal([d, b, e].map(&:data)            , in_order_traversal(b).map(&:data))
    assert_equal([f, c, g].map(&:data)            , in_order_traversal(c).map(&:data))
    assert_equal([d].map(&:data)                  , in_order_traversal(d).map(&:data))
    assert_equal([e].map(&:data)                  , in_order_traversal(e).map(&:data))
    assert_equal([f].map(&:data)                  , in_order_traversal(f).map(&:data))
    assert_equal([g].map(&:data)                  , in_order_traversal(g).map(&:data))
  end
end

describe "#pre_order_traversal" do
  it "iterates through the tree preorder" do
    a, b, c, d, e, f, g = tree

    assert_equal([a, b, d, e, c, f, g].map(&:data), pre_order_traversal(a).map(&:data))
  end
end

describe "#post_order_traversal" do
  it "iterates through the tree preorder" do
    a, b, c, d, e, f, g = tree

    assert_equal([d, e, b, f, g, c, a].map(&:data), post_order_traversal(a).map(&:data))
  end
end

describe "#bfs" do
  it "iterates through the tree in a bfs manner" do
    a, b, c, d, e, f, g = tree

    assert_equal([a, b, c, d, e, f, g].map(&:data), bfs(a).map(&:data))
  end
end
