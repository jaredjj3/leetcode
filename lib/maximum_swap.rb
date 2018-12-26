require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given a non-negative integer, you could swap two digits at most once to get the maximum valued number. Return the maximum valued number you could get.

Example 1:
Input: 2736
Output: 7236
Explanation: Swap the number 2 and the number 7.
Example 2:
Input: 9973
Output: 9973
Explanation: No swap.
Note:
The given number is in the range [0, 108]
=end

def maximum_swap(num)
  max = num
  chars = num.to_s.split("")

  chars.each_index do |ndx1|
    chars.each_index do |ndx2|
      dup_chars = chars.dup
      tmp = dup_chars[ndx1]
      dup_chars[ndx1] = dup_chars[ndx2]
      dup_chars[ndx2] = tmp
      max = [max, dup_chars.join.to_i].max
    end
  end

  max
end

describe "#maximum_swap" do
  it "solves the problem prompt" do
    assert_equal(7236, maximum_swap(2736))
    assert_equal(9973, maximum_swap(9973))
  end

  it "solves failing leetcode tests" do
    assert_equal(98863, maximum_swap(98368))
  end
end
