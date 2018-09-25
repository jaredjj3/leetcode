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

def length_of_longest_substring(str)
    
end

describe "#length_longest_substring" do
  it "finds the length of the longest substring without repeating characters" do
    assert_equal(3, length_of_longest_substring("abcabcbb"))
    assert_equal(1, length_of_longest_substring("bbbbb"))
    assert_equal(3, length_of_longest_substring("pwwkew"))
  end
end
