require_relative "../data_structures/data_structures.rb"

# SESSION
# 1

# PROMPT
=begin
Given an array nums and a target value k, find the maximum length of a subarray that sums to k. If there isn't one, return 0 instead.

Note:
The sum of the entire nums array is guaranteed to fit within the 32-bit signed integer range.

Example 1:

Input: nums = [1, -1, 5, -2, 3], k = 3
Output: 4 
Explanation: The subarray [1, -1, 5, -2] sums to 3 and is the longest.
Example 2:

Input: nums = [-2, -1, 2, 1], k = 1
Output: 2 
Explanation: The subarray [-1, 2] sums to 1 and is the longest.
Follow Up:
Can you do it in O(n) time?
=end

def max_sub_array_len(nums, k)
  sum = 0
  max = 0
  map = {}

  nums.each.with_index do |num, ndx|
    sum += num
    if sum == k
      max = ndx + 1
    elsif map.key?(sum - k)
      max = [max, ndx - map[sum - k]].max
    end

    map[sum] ||= ndx
  end

  max
end
