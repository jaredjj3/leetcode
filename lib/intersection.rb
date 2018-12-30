require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given two arrays, write a function to compute their intersection.

Example 1:

Input: nums1 = [1,2,2,1], nums2 = [2,2]
Output: [2]
Example 2:

Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
Output: [9,4]
Note:

Each element in the result must be unique.
The result can be in any order.
=end

def intersection(nums1, nums2)
  shorter, longer = nums1.size < nums2.size ? [nums1, nums2] : [nums2, nums1]
  longer = longer.to_set
  shorter.select { |el| longer.include?(el) }.uniq
end

describe "#intersection" do
  it "solves the problem prompt" do
    flunk
  end
end
