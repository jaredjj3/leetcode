require_relative "../data_structures/data_structures.rb"

# SESSION
# 1

# PROMPT
=begin
Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.
Note that an empty string is also considered valid.

Example 1:

Input: "()"
Output: true
Example 2:

Input: "()[]{}"
Output: true
Example 3:

Input: "(]"
Output: false
Example 4:

Input: "([)]"
Output: false
Example 5:

Input: "{[]}"
Output: true
=end

PARENS = {
  "(" => ")",
  "[" => "]",
  "{" => "}"
}.freeze

def valid_parentheses(str)
  stack = []

  str.each_char do |char|
    if PARENS.key?(char)
      stack << char
    else
      return false unless char == PARENS[stack.pop]
    end
  end

  stack.empty?
end

def is_valid(str)
  valid_parentheses(str)
end