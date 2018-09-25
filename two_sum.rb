require "minitest/autorun"

# Given an array of integers, return indices of the two numbers such that they add up to a specific target.
# You may assume that each input would have exactly one solution, and you may not use the same element twice.
# Example:
# Given nums = [2, 7, 11, 15], target = 9,
# Because nums[0] + nums[1] = 2 + 7 = 9,
# return [0, 1].

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  
end

describe "#two_sum" do
  it "returns the indices of the two numbers such that they add up to the target" do
    assert_equal(two_sum([2, 7, 11, 15], 9), [0, 1])
    assert_equal(two_sum([2, 7, 11, 15], 18), [1, 2])
    assert_equal(two_sum([2, 7, 11, 15], 17), [0, 3])
  end
end
