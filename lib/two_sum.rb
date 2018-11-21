require "minitest/autorun"

# Given an array of integers, return indices of the two numbers such that they add up to a specific target.
# You may assume that each input would have exactly one solution, and you may not use the same element twice.
# Example:
# Given nums = [2, 7, 11, 15], target = 9,
# Because nums[0] + nums[1] = 2 + 7 = 9,
# return [0, 1].

# NAIVE APPROACH: O(n**2) time, O(1) space
#
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
# def two_sum(nums, target)
#   nums.each.with_index do |num, ndx1|
#     nums[(ndx1 + 1)..-1].each.with_index do |other_num, ndx2|
#       return [ndx1, ndx1 + ndx2 + 1] if num + other_num == target
#     end
#   end
#
#   nil
# end

# BETTER APPROACH: O(n) time, O(n) space 
#
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
# def two_sum(nums, target)
#   ndx_by_num = nums.each.with_object({}).with_index { |(num, memo), ndx| memo[num] = ndx }
#   nums.each.with_index do |num, ndx|
#     other_ndx = ndx_by_num[target - num]
#     return [ndx, other_ndx] if !other_ndx.nil? && other_ndx != ndx
#   end
#
#   nil
# end

# BEST APPROACH: O(n) time, O(n) space 
#
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  nums.each.with_object({}).with_index do |(num, memo), ndx|
    other_ndx = memo[target - num]
    return [ndx, other_ndx].sort unless other_ndx.nil?
    memo[num] = ndx
  end

  nil
end

describe "#two_sum" do
  it "returns the indices of the two numbers such that they add up to the target" do
    assert_equal([0, 1], two_sum([2, 7, 11, 15], 9))
    assert_equal([1, 2], two_sum([2, 7, 11, 15], 18))
    assert_equal([0, 3], two_sum([2, 7, 11, 15], 17))
    assert_equal([0, 1], two_sum([2, 2, 11, 15], 4))
  end
end