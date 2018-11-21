require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given a string, your task is to count how many palindromic substrings in this string.

The substrings with different start indexes or end indexes are counted as different substrings even they consist of same characters.

Example 1:
Input: "abc"
Output: 3
Explanation: Three palindromic strings: "a", "b", "c".
Example 2:
Input: "aaa"
Output: 6
Explanation: Six palindromic strings: "a", "a", "a", "aa", "aa", "aaa".
Note:
The input string length won't exceed 1000.
=end

def count_substrings(str)
  return str.length if str.length <= 1
  
  count = str.length

  (2..str.length).each do |substr_length|
    (0..(str.length - substr_length)).each do |ndx|
      count += palindrome?(str[ndx...(ndx + substr_length)]) ? 1 : 0
    end
  end

  count
end

def palindrome?(str)
  str == str.reverse
end

describe "#count_substrings" do
  it "counts the number of palindromic substrings" do
    assert_equal(1, count_substrings("a"))
    assert_equal(3, count_substrings("abc"))
    assert_equal(6, count_substrings("aaa"))
    assert_equal(6, count_substrings("hello"))
  end

  it "returns 0 for an empty string" do
    assert_equal(0, count_substrings(""))
  end
end
