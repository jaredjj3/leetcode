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
  triplets = []
  sorted = nums.sort

  p_ndx = 0
  while p_ndx < sorted.size - 2
    probe = sorted[p_ndx]

    l_ndx = p_ndx + 1
    r_ndx = sorted.size - 1
    while l_ndx < r_ndx
      left = sorted[l_ndx]
      right = sorted[r_ndx]

      sum = probe + left + right

      if sum < 0
        l_ndx += 1
      elsif sum > 0
        r_ndx -= 1
      else # sum == 0
        triplets << [probe, left, right]

        # increment l_ndx to next uniq number in sorted
        l_ndx += 1 while sorted[l_ndx] == left && l_ndx < r_ndx

        # decrement r_ndx to next uinq number in sorted
        r_ndx -= 1 while sorted[r_ndx] == right && l_ndx < r_ndx
      end
    end

    # increment p_ndx to next uniq number in sorted
    p_ndx += 1 while sorted[p_ndx] == probe && p_ndx < sorted.size - 2
  end

  triplets
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

  it "solves failing tests" do
    triplets = [
      [-1, 0, 1]
    ]

    assert_equal(set_of_sorted_arr(triplets), set_of_sorted_arr(three_sum([1, -1, -1, 0])))
  end
end
