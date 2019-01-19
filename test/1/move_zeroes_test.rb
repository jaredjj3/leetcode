require "minitest/autorun"
require_relative "../../lib/1/move_zeroes.rb"

# SESSION
# 1

describe "#move_zeroes" do
  it "solves empty arrays" do
    nums = []
    move_zeroes(nums)
    assert_equal([], nums)
  end

  it "solves trivial arrays" do
    nums = [0, 1]
    move_zeroes(nums)
    assert_equal([0, 1], nums)
  end

  it "moves zeros in place to the end of the array" do
    nums = [1, 0, 2, 3, 0, 4, 0, 0]
    move_zeroes(nums)
    assert_equal([1, 2, 3, 4, 0, 0, 0], nums)
  end
end
