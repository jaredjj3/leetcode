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

def find_kth_largest(arr, k)
  max = arr[0]
  depth = 1

  arr[1..-1].each do |el|
    if el > max

    elsif el < max

    end
  end

  max
end

describe "#find_kth_largest" do
  it "solves the problem prompt" do
    assert_equal(5, find_kth_largest([3,2,1,5,6,4], 2))
    assert_equal(4, find_kth_largest([3,2,3,1,2,4,5,5,6], 4))
  end
end
