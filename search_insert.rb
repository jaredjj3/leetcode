require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

You may assume no duplicates in the array.

Example 1:

Input: [1,3,5,6], 5
Output: 2
Example 2:

Input: [1,3,5,6], 2
Output: 1
Example 3:

Input: [1,3,5,6], 7
Output: 4
Example 4:

Input: [1,3,5,6], 0
Output: 0
=end

def search_insert(nums, target)
  nums.each.with_index { |num, ndx| return ndx if num >= target }
  nums.size
end

describe "#search_insert" do
  it "solves the problem prompt" do
    assert_equal(2, search_insert([1, 3, 5, 6], 5))
    assert_equal(1, search_insert([1, 3, 5, 6], 2))
    assert_equal(4, search_insert([1, 3, 5, 6], 7))
    assert_equal(0, search_insert([1, 3, 5, 6], 0))
  end
end
