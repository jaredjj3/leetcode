require_relative "../data_structures/data_structures.rb"

# SESSION
# 1

# PROMPT
=begin
Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

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

def three_sum(nums)
  sums = []
  sorted = nums.sort
  
  c_ndx = 0
  while c_ndx <= sorted.size - 3
    curr = sorted[c_ndx]

    l_ndx = c_ndx + 1
    r_ndx = sorted.size - 1
    while l_ndx < r_ndx
      left = sorted[l_ndx]
      right = sorted[r_ndx]
      
      sum = curr + left + right

      if sum == 0
        sums << [curr, left, right]
        l_ndx += 1 while left == sorted[l_ndx] && l_ndx < r_ndx 
        r_ndx -= 1 while right == sorted[r_ndx] && l_ndx < r_ndx
      elsif sum > 0
        r_ndx -= 1
      else
        l_ndx += 1
      end
    end

    c_ndx += 1 while curr == sorted[c_ndx] && c_ndx <= sorted.size - 3
  end

  sums
end
