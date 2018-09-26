require "minitest/autorun"

# There are two sorted arrays nums1 and nums2 of size m and n respectively.

# Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

# You may assume nums1 and nums2 cannot be both empty.

# Example 1:

# nums1 = [1, 3]
# nums2 = [2]

# The median is 2.0
# Example 2:

# nums1 = [1, 2]
# nums2 = [3, 4]

# The median is (2 + 3)/2 = 2.5

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
    
end

describe "#find_median_sorted_arrays" do
  it "finds the median of two sorted arrays" do
    assert_equal(2.0, find_median_sorted_arrays([1, 3], [2]))
    assert_equal(2.5, find_median_sorted_arrays([1, 2], [3, 4]))
  end
end
