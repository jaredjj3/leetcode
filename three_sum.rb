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
  nums
end

describe "#three_sum" do
  it "solves the problem prompt" do
    triplets = [
      [-1, 0, 1],
      [-1, -1, 2]
    ]

    assert_equal(triplets.to_set, three_sum([-1, 0, 1, 2, -1, -4]).to_set)
  end
end
