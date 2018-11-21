require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given a non-empty string check if it can be constructed by taking a substring of it and appending
multiple copies of the substring together. You may assume the given string consists of lowercase
English letters only and its length will not exceed 10000. 

Example 1:

Input: "abab"
Output: True
Explanation: It's the substring "ab" twice.
Example 2:

Input: "aba"
Output: False
Example 3:

Input: "abcabcabcabc"
Output: True
Explanation: It's the substring "abc" four times. (And the substring "abcabc" twice.)
=end

# def repeated_substring_pattern(str)
#   divisors(str.length).any? { |length| length != str.length && str.split(str[0...length]).empty? }
# end

def divisors(num)
  (1..num).each.with_object([]) { |n, divisors| divisors << n if num % n == 0 }
end

def repeated_substring_pattern(str)
  s = str + str
  s[1...s.length - 1].include?(str)
end

describe "#repeated_substring_pattern" do
  it "solves the problem prompt" do
    assert(repeated_substring_pattern("ababab"))
    refute(repeated_substring_pattern("aba"))
    assert(repeated_substring_pattern("abcabcabc"))
  end
end

describe "#divisors" do 
  it "returns an array of numbers divisible by num" do
    assert_equal([1, 2, 4, 8].to_set, divisors(8).to_set)
    assert_equal([1, 2, 3, 4, 6, 12].to_set, divisors(12).to_set)
  end
end