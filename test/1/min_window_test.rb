require "minitest/autorun"
require_relative "../../lib/1/min_window.rb"

# SESSION
# 1

describe "#min_window" do
  it "solves the problem prompt" do
    assert_equal("bcde", min_window("abcdebdde", "bde"))
  end
end
