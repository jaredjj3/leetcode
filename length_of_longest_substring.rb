require "minitest/autorun"

# Given a string, find the length of the longest substring without repeating characters.
#
# Example 1:
# Input: "abcabcbb"
# Output: 3 
# Explanation: The answer is "abc", with the length of 3. 

# Example 2:
# Input: "bbbbb"
# Output: 1
# Explanation: The answer is "b", with the length of 1.

# Example 3:
# Input: "pwwkew"
# Output: 3
# Explanation: The answer is "wke", with the length of 3. 
#              Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

require "set"

# SOLUTION 1: O(n**2) time, O(n) space
#
# @param {String} s
# @return {Integer}
def length_of_longest_substring(str)
  chars = str.chars
  max = 0

  chars.each.with_index do |start_char, start_ndx|
    seen = Set.new([start_char])
    chars[(start_ndx + 1)..-1].each.with_index { |end_char, end_ndx| break unless seen.add?(end_char) }
    max = [seen.size, max].max
  end

  max
end

describe "#length_longest_substring" do
  it "finds the length of the longest substring without repeating characters" do
    assert_equal(3, length_of_longest_substring("abcabcbb"))
    assert_equal(1, length_of_longest_substring("bbbbb"))
    assert_equal(3, length_of_longest_substring("pwwkew"))
    assert_equal(8, length_of_longest_substring("ddjfkkqwertyaa"))
  end
end
