require "minitest/autorun"
require_relative "../../lib/1/max_profit.rb"

# SESSION
# 1

describe "#max_profit" do
  it "returns the maximum profit" do
    assert_equal(5, max_profit([7, 1, 5, 3, 6, 4]))
  end

  it "returns 0 if profit cannot be made" do
    assert_equal(0, max_profit([7, 6, 5, 4, 3, 2, 1]))
  end
end
