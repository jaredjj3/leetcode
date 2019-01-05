require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

Example 1:

Input: "babad"
Output: "bab"
Note: "aba" is also a valid answer.
Example 2:

Input: "cbbd"
Output: "bb"
=end

def longest_palindrome(str)
  return "" if str.empty?

  left = 0
  right = 0

  str.chars.each_index do |ndx|
    len = [
      expand(str, ndx, ndx),
      expand(str, ndx, ndx + 1)
    ].max

    if len > right - left
      left = ndx - (len - 1) / 2
      right = ndx + len / 2
    end
  end

  str[left..right]
end

def expand(str, l_ndx, r_ndx)
  l = l_ndx
  r = r_ndx

  while l >= 0 && r < str.size && str[l] == str[r]
    l -= 1
    r += 1
  end

  r - l - 1
end

describe "#longest_palindrome" do
  it "solves the problem prompt" do
    assert(["bab", "aba"].include?(longest_palindrome("babad")))
    assert_equal("bb", longest_palindrome("cbbd"))
    assert_equal("bbabb", longest_palindrome("abbabb"))
    assert_equal("a", longest_palindrome("a"))
  end

  it "returns an empty string if str is empty?" do
    assert_equal("", longest_palindrome(""))
  end
end
