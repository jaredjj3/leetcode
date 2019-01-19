require "minitest/autorun"
require_relative "../../lib/1/move_zeroes.rb"

# SESSION
# 1

describe "#move_zeroes" do
  it "returns nil" do
    assert_nil(move_zeroes([1, 2, 4]))
  end

  it "move zeroes of empty arrays in place" do
    nums = []
    move_zeroes(nums)
    assert_equal([], nums)
  end

  it "moves zeroes of trivial arrays in place" do
    nums = [0, 1]
    move_zeroes(nums)
    assert_equal([1, 0], nums)
  end

  it "moves zeroes of more complicated arrays in place and preserves order" do
    nums = [1, 0, 2, 3, 0, 4, 0, 0]
    move_zeroes(nums)
    assert_equal([1, 2, 3, 4, 0, 0, 0, 0], nums)
  end
end
