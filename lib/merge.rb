require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.

Note:

The number of elements initialized in nums1 and nums2 are m and n respectively.
You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2.
Example:

Input:
nums1 = [1,2,3,0,0,0], m = 3
nums2 = [2,5,6],       n = 3

Output: [1,2,2,3,5,6]
=end

def merge(nums1, m, nums2, n)
  m_ndx = 0
  n_ndx = 0
  nums1.select!.with_index { |_, ndx| ndx < m }

  while n_ndx < n
    num1 = nums1[m_ndx]
    num2 = nums2[n_ndx]

    if num1.nil?
      nums1 << num2
      n_ndx += 1
    elsif num1 <= num2
      m_ndx += 1
    else
      nums1.insert(m_ndx, num2)
      n_ndx += 1
    end
  end

  nil
end

describe "#merge" do
  it "returns nil" do
    assert_nil(merge([1, 2, 3], 3, [4, 5, 6], 3))
    assert_nil(merge([], 0, [], 0))
    assert_nil(merge([1, 2, 3], 3, [], 0))
  end

  it "modifies num1s in place to have sorted elements of each nums array" do
    nums1 = [1, 2, 3]
    merge(nums1, 3, [4, 5, 6], 3)
    assert_equal([1, 2, 3, 4, 5, 6], nums1)
  end
end
