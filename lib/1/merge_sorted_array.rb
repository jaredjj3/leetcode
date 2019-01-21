require_relative "../data_structures/data_structures.rb"

# SESSION
# 1

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

def merge_sorted_array(nums1, m, nums2, n)
  ndx1 = 0
  ndx2 = 0

  while ndx1 < m && ndx2 < n
    n1 = nums1[ndx1]
    n2 = nums2[ndx2]

    if ndx1 >= m
      nums1[ndx1] = n2
      ndx1 += 1
      ndx2 += 2
    elsif ndx2 >= n
      ndx1 += 1
    elsif n1 <= n2
      ndx1 += 1
    else
      nums1.insert(ndx1, n2)
      ndx2 += 1
    end
  end

  nil
end
