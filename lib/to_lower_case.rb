require "minitest/autorun"

# PROMPT
=begin
Implement function ToLowerCase() that has a string parameter str, and returns the same string in lowercase. 

Example 1:

Input: "Hello"
Output: "hello"
Example 2:

Input: "here"
Output: "here"
Example 3:

Input: "LOVELY"
Output: "lovely"
=end

def to_lower_case(str)
  str.downcase
end

describe "#to_lower_case" do
  it "solves the problem prompt" do
    assert_equal("hello", to_lower_case("Hello"))
    assert_equal("here", to_lower_case("here"))
    assert_equal("lovely", to_lower_case("LOVELY"))
  end
end
