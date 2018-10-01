require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0?
Find all unique triplets in the array which gives the sum of zero.

Note:

The solution set must not contain duplicate triplets.

Example:

Given array nums = [-1, 0, 1, 2, -1, -4],

A solution set is:
[
  [-1, 0, 1],
  [-1, -1, 2]
]
=end

require "set"

# NAIVE SOLUTION O(n**2) time, O(1) space
def three_sum(nums)
  triplets = Set.new

  ndxes_by_num = nums.each.with_index.reduce(Hash.new { |h, k| h[k] = Set.new }) do |memo, (num, ndx)|
    memo[num] << ndx
    memo
  end

  nums.each.with_index do |num1, ndx1|
    nums.each.with_index do |num2, ndx2|
      next if ndx1 == ndx2
      sum = num1 + num2
      ndxes = ndxes_by_num.fetch(-sum, Set.new).dup
      ndxes -= Set.new([ndx1, ndx2])
      ndxes.each do |ndx3|
        triplets << [num1, num2, nums[ndx3]].sort
      end
    end
  end
  

  triplets.to_a
end

describe "#three_sum" do
  def set_of_sorted_arr(arr_of_arr)
    arr_of_arr.map(&:sort).to_set
  end

  it "solves the problem prompt" do
    triplets = [
      [-1, 0, 1],
      [-1, -1, 2]
    ]

    assert_equal(set_of_sorted_arr(triplets), set_of_sorted_arr(three_sum([-1, 0, 1, 2, -1, -4])))
  end
end
