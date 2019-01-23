require "minitest/autorun"
require_relative "../../lib/1/diameter_of_binary_tree.rb"

# SESSION
# 1

describe "#depth" do
  let (:root) do
    nodes = (0..4).map { |ndx| Tree::Node.new(ndx) }

    nodes[0].left  = nodes[1]
    nodes[0].right = nodes[3]

    nodes[1].left = nodes[2]

    nodes[0]
  end

  it "returns the depth of the tree" do
    assert_equal(3, depth(root))
  end
end
