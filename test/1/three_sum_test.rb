require "minitest/autorun"
require_relative "../../lib/1/three_sum.rb"

# SESSION
# 1

describe "#three_sum" do
  it "solves empty arrays" do
    assert_equal([], three_sum([]))
  end

  it "solves the problem prompt" do
    nums = [-1, 0, 1, 2, -1, -4]
    act = three_sum(nums)
    exp = [
      [-1, 0, 1],
      [-1, -1, 2]
    ]

    assert_equal(2, act.size)
    assert_equal(exp.map(&:sort).to_set, act.map(&:sort).to_set)
  end
end
