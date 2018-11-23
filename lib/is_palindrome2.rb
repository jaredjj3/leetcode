require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

Note: For the purpose of this problem, we define empty string as valid palindrome.

Example 1:

Input: "A man, a plan, a canal: Panama"
Output: true
Example 2:

Input: "race a car"
Output: false
=end

def is_palindrome(str)
  sanitized = sanitize(str).map(&:downcase).join
  sanitized == sanitized.reverse
end

def sanitize(str)
  str.scan(/[A-Za-z0-9]+/)
end

describe "#is_palindrome2" do
  it "only considers alphanumeric characters and ignores cases" do
    assert_equal(true, is_palindrome("A man, a plan, a canal: Panama"))
  end

  it "returns false if the sanitized string is not a palindrome" do
    assert_equal(false, is_palindrome("race a car"))
  end
end
