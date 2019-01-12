require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.

Example 1:

Input: [3,2,1,5,6,4] and k = 2
Output: 5
Example 2:

Input: [3,2,3,1,2,4,5,5,6] and k = 4
Output: 4
Note: 
You may assume k is always valid, 1 ≤ k ≤ array's length.
=end

# Naive solution
# let n be the number of elements in +arr+
# Time Complexity O(n log(n))
# Space Complexity O(1)
# def find_kth_largest(arr, k)
#   arr.sort![-k]
# end

def find_kth_largest(arr, k, lb = 0, rb = nil)
  pivot = rand(lb...(rb || arr.size))
  probe = arr.delete_at(pivot)
  left, right = arr.partition { |el| el <= probe }

  next_arr = left + [probe] + right
  m = pivot - lb + 1
  if m == k
    probe
  elsif m > k
    find_kth_largest(next_arr, k, lb, pivot - 1)
  else # k_ndx > k
    find_kth_largest(next_arr, k - m, pivot + 1, rb || arr.size)
  end
end

describe "#find_kth_largest" do
  it "solves the problem prompt" do
    assert_equal(5, find_kth_largest([3, 2, 1, 5, 6, 4], 2))
    assert_equal(4, find_kth_largest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4))
    assert_equal(-1, find_kth_largest([-1, -1], 2))
    assert_equal(3, find_kth_largest([3, 3, 3, 3, 3, 3, 3, 3, 3], 8))
    assert_equal(1, find_kth_largest([2, 1], 2))
  end
end
