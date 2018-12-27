require "minitest/autorun"
require "byebug"

# PROMPT
=begin
A message containing letters from A-Z is being encoded to numbers using the following mapping:

'A' -> 1
'B' -> 2
...
'Z' -> 26
Given a non-empty string containing only digits, determine the total number of ways to decode it.

Example 1:

Input: "12"
Output: 2
Explanation: It could be decoded as "AB" (1 2) or "L" (12).
Example 2:

Input: "226"
Output: 3
Explanation: It could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).
=end

def num_decodings
end

describe "#num_decodings" do
  it "solves simple examples" do
    assert_equal(2, num_decodings("12"))
    assert_equal(1, num_decodings("1"))
    assert_equal(1, num_decodings("10"))
  end

  it "returns 0 if the string is invalid" do
    assert_equal(0, num_decodings("0"))
    assert_equal(0, num_decodings(""))
    assert_equal(0, num_decodings("012"))
    assert_equal(0, num_decodings("01"))
    assert_equal(0, num_decodings("010"))
  end

  it "solves more complex examples" do
    assert_equal(3, num_decodings("226"))
    assert_equal(5, num_decodings("2116"))
  end
end
