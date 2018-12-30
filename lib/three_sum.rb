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

def three_sum(nums)
  triplets = Set.new
  
  sorted = nums.sort
  sorted[0...-2].each.with_index do |probe, ndx|
    l_ndx = ndx + 1
    r_ndx = sorted.size - 1
    
    while l_ndx < r_ndx
      left = sorted[l_ndx]
      right = sorted[r_ndx]

      sum = probe + left + right

      if sum > 0
        r_ndx -= 1
      elsif sum < 0
        l_ndx += 1
      else
        triplets << [probe, left, right]
        l_ndx += 1
        r_ndx -= 1
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
