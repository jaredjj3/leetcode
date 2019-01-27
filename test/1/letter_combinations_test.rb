require "minitest/autorun"
require_relative "../../lib/1/letter_combinations.rb"

# SESSION
# 1

describe "#letter_combinations" do
  it "solves the problem prompt" do
    assert_equal(
      %W(ad ae af bd be bf cd ce cf).sort,
      letter_combinations("23").sort
    )
  end
end
