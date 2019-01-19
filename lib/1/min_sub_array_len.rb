require_relative "../data_structures/data_structures.rb"

# SESSION
# 1

# PROMPT
=begin
Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.

Example: 

Input: s = 7, nums = [2,3,1,2,4,3]
Output: 2
Explanation: the subarray [4,3] has the minimal length under the problem constraint.
Follow up:
If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log n). 
=end

def min_sub_array_len(target, nums)
  min = nil
  sum = 0
  l_ndx = 0
  r_ndx = 0

  while r_ndx < nums.size
    sum += nums[r_ndx]

    while sum >= target && l_ndx <= r_ndx
      min = [min, r_ndx - l_ndx + 1].compact.min
      return min if min == 1
      sum -= nums[l_ndx]
      l_ndx += 1
    end

    r_ndx += 1
  end

  min || 0
end
