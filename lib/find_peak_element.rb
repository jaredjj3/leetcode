require "minitest/autorun"
require "byebug"

# PROMPT
=begin
A peak element is an element that is greater than its neighbors.

Given an input array nums, where nums[i] ≠ nums[i+1], find a peak element and return its index.

The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.

You may imagine that nums[-1] = nums[n] = -∞.

Example 1:

Input: nums = [1,2,3,1]
Output: 2
Explanation: 3 is a peak element and your function should return the index number 2.
Example 2:

Input: nums = [1,2,1,3,5,6,4]
Output: 1 or 5 
Explanation: Your function can return either index number 1 where the peak element is 2, 
             or index number 5 where the peak element is 6.
Note:

Your solution should be in logarithmic complexity.
=end

def find_peak_element(nums)
  return nums.index(nums.max) if nums.size <= 3

  probe_ndx = nums.size / 2
  before, probe, after = nums[probe_ndx - 1..probe_ndx + 1]
  return probe_ndx if (before || -Float::INFINITY) < probe && probe > (after || -Float::INFINITY)

  left = nums[0...probe_ndx]
  right = nums[(probe_ndx + 1)..-1]

  if target_ndx = find_peak_element(left)
    target_ndx
  elsif target_ndx = find_peak_element(right)
    target_ndx + probe_ndx
  else
    nil
  end
end
