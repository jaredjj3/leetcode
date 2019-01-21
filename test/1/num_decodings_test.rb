require "minitest/autorun"
require_relative "../../lib/1/num_decodings.rb"

# SESSION
# 1

describe "#num_decodings" do
  it "solves the problem prompt" do
    assert_equal(2, num_decodings("12"))
    assert_equal(3, num_decodings("226"))
  end
end
