require "minitest/autorun"
require_relative "../../lib/1/min_sub_array_len.rb"

# SESSION
# 1

describe "#min_sub_array_len" do
  it "solves the problem prompt" do
    assert_equal(2, min_sub_array_len(7, [2, 3, 1, 2, 4, 3]))
  end

  it "solves failing test cases" do
    assert_equal(3, min_sub_array_len(11, [1, 2, 3, 4, 5]))
    assert_equal(1, min_sub_array_len(4, [1, 4, 4]))
  end
end
