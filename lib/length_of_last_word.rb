require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word in the string.

If the last word does not exist, return 0.

Note: A word is defined as a character sequence consists of non-space characters only.

Example:

Input: "Hello World"
Output: 5
=end

def length_of_last_word(str)
  arr = str.split
  return 0 if arr.empty?
  arr.last.length
end

describe "#length_of_last_word" do
  it "returns 0 if a word does not exist" do
    assert_equal(0, length_of_last_word(""))
  end

  it "returns the length of the last word in the string" do
    assert_equal(5, length_of_last_word("hello world"))
  end

  it "handles newlines and tabs" do
    assert_equal(3, length_of_last_word("none of these words have\nthree\tletters foo"))
  end
end
