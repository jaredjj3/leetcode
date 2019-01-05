require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given two arrays, write a function to compute their intersection.

Example 1:

Input: nums1 = [1,2,2,1], nums2 = [2,2]
Output: [2,2]
Example 2:

Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
Output: [4,9]
Note:

Each element in the result should appear as many times as it shows in both arrays.
The result can be in any order.
Follow up:

What if the given array is already sorted? How would you optimize your algorithm?
What if nums1's size is small compared to nums2's size? Which algorithm is better?
What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?
=end

def intersect(nums1, nums2)
  freq_hash = nums2.each.with_object(Hash.new { |h, k| h[k] = 0 }) do |num, hash|
    hash[num] += 1
  end

  nums1.select do |num|
    select = freq_hash[num] > 0
    freq_hash[num] -= 1
    select
  end
end

describe "#intersect" do
  it "solves the problem prompt" do
    assert_equal([2, 2], intersect([1, 2, 2, 1], [2, 2]))
    assert_equal([4, 9], intersect([4, 9, 5], [9, 4, 9, 8, 4]).sort)
  end
end
