require "minitest/autorun"
require_relative "../../lib/1/max_sub_array_len.rb"

# SESSION
# 1

describe "#max_sub_array_len" do
  it "returns 0 if there isn't a solution" do
    assert_equal(0, max_sub_array_len([1, 1, 1, 1, 1], 100))
  end

  it "returns the max length of a subarray that sums to k" do
    assert_equal(4, max_sub_array_len([1, 1, 1, 1], 4))
    assert_equal(4, max_sub_array_len([1, -1, 5, -2, 3], 3))
    assert_equal(2, max_sub_array_len([-2, -1, 2, 1], 1))
  end
end
