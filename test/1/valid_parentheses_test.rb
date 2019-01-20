require "minitest/autorun"
require_relative "../../lib/1/valid_parentheses.rb"

# SESSION
# 1

describe "#valid_parentheses" do
  it "returns true if the parentheses are valid" do
    assert(valid_parentheses("()[]{}"))
    assert(valid_parentheses("(())"))
    assert(valid_parentheses("()({})"))
    assert(valid_parentheses("()()()"))
  end

  it "returns false if the parentheses are invalid" do
    refute(valid_parentheses("()[{})"))
    refute(valid_parentheses("((})"))
    refute(valid_parentheses("())"))
    refute(valid_parentheses("([)()(])"))
  end
end
