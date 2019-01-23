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
    nodes[4].right = nodes[5]

    nodes
  end

  it "solves the problem prompt" do
    flatten_tree(nodes[0])

    exp = [nil, 1, nil, 2, nil, 3, nil, 4, nil, 5, nil, nil]
    act = nodes.flat_map { |node| [node.left&.value, node.right&.value] }
    assert_equal(exp, act)
  end
end
