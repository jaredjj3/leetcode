require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

Example:

Input: [-2,1,-3,4,-1,2,1,-5,4],
Output: 6
Explanation: [4,-1,2,1] has the largest sum = 6.
Follow up:

If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
=end

def max_sub_array(nums)
  ndx = 1

  while ndx < nums.size 
    nums[ndx] += nums[ndx - 1]  if nums[ndx - 1] > 0
    ndx += 1
  end

  nums.max
end

describe "#max_sub_array" do
  it "solves the problem prompt" do
    assert_equal(6, max_sub_array([-2, 1, -3, 4, -1, 2, 1, -5, 4]))
  end
end
