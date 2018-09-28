require "minitest/autorun"

# Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

# An input string is valid if:

# Open brackets must be closed by the same type of brackets.
# Open brackets must be closed in the correct order.
# Note that an empty string is also considered valid.

# Example 1:

# Input: "()"
# Output: true
# Example 2:

# Input: "()[]{}"
# Output: true
# Example 3:

# Input: "(]"
# Output: false
# Example 4:

# Input: "([)]"
# Output: false
# Example 5:

# Input: "{[]}"
# Output: true

TOKENS = {
  "(" => ")",
  "[" => "]",
  "{" => "}"
}.freeze

def opened?(str)
  TOKENS.key?(str)
end

# @param {String} s
# @return {Boolean}
def is_valid(str)
  opened_tokens = []

  str.chars.each do |token|
    if opened?(token)
      opened_tokens << token
    else
      complement = TOKENS[opened_tokens.last]
      if complement == token
        opened_tokens.pop
      else
        return false
      end
    end
  end

  opened_tokens.empty?
end

describe "#is_valid" do
  it "determines if all parentheses pairs are valid" do
    assert(is_valid("()"))
    assert(is_valid("()[]{}"))
    refute(is_valid("(]"))
    refute(is_valid("([)]"))
    assert(is_valid("{[]}"))
  end
end
