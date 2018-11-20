require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given a non-empty array of non-negative integers nums, the degree of this array is defined as the maximum frequency of any one of its elements.

Your task is to find the smallest possible length of a (contiguous) subarray of nums, that has the same degree as nums.

Example 1:
Input: [1, 2, 2, 3, 1]
Output: 2
Explanation: 
The input array has a degree of 2 because both elements 1 and 2 appear twice.
Of the subarrays that have the same degree:
[1, 2, 2, 3, 1], [1, 2, 2, 3], [2, 2, 3, 1], [1, 2, 2], [2, 2, 3], [2, 2]
The shortest length is 2. So return 2.
Example 2:
Input: [1,2,2,3,1,4,2]
Output: 6
Note:

nums.length will be between 1 and 50,000.
nums[i] will be an integer between 0 and 49,999.
=end

def find_shortest_sub_array(nums)
  degree = degree_of(nums)
  sub_arrs(nums, degree).map(&:size).min
end

def degree_of(objs)
  obj_to_freq = objs.each.with_object(Hash.new { |h, k| h[k] = 0 }) do |obj, degree|
    degree[obj] += 1
  end

  obj_to_freq.values.max
end

def sub_arrs(arr, degree)
  return [] if arr.length < degree
  sub_arr_w_degree = degree_of(arr) == degree ? arr : []
  [sub_arr_w_degree, *sub_arrs(arr[1..-1], degree), *sub_arrs(arr[0..-2], degree)].reject(&:empty?)
end

describe "#find_shortest_sub_array" do
  it "solves the problem prompt" do
    assert_equal(2, find_shortest_sub_array([1, 2, 2, 3, 1]))
  end
end
