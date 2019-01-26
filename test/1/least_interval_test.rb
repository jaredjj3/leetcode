require "minitest/autorun"
require_relative "../../lib/1/least_interval.rb"

# SESSION
# 1

describe "#least_interval" do
  it "solves the problem prompt" do
    assert_equal(8, least_interval(%W(A A A B B B), 2))
  end

  it "solves failing tests" do
    assert_equal(16, least_interval(["A","A","A","A","A","A","B","C","D","E","F","G"], 2))
  end
end
