require "minitest/autorun"
require_relative "../../lib/1/flatten_tree.rb"

# SESSION
# 1

describe "#flatten_tree" do
  let (:nodes) do 
    nodes = (0..5).map { |ndx| Tree::Node.new(ndx) }

    # 0
    nodes[0].left  = nodes[1]
    nodes[0].right = nodes[4]

    # 1
    nodes[1].left  = nodes[2]
    nodes[1].right = nodes[3]

    # 4
    nodes.right  = nodes[5]

    nodes
  end

  it "solves the problem prompt" do
    flatten_tree(nodes[0])
    nodes.each { |node| assert_nil(node.left) }
    nodes.each_cons(2) { |node1, node2| assert_equal(node2, node1.right) }
  end
end
