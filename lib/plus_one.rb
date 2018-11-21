require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given a non-empty array of digits representing a non-negative integer, plus one to the integer.

The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.

You may assume the integer does not contain any leading zero, except the number 0 itself.

Example 1:

Input: [1,2,3]
Output: [1,2,4]
Explanation: The array represents the integer 123.
Example 2:

Input: [4,3,2,1]
Output: [4,3,2,2]
Explanation: The array represents the integer 4321.
=end

# Let n be the number of elements in arr
# Time complexity O(n), space complexity O(n)
def plus_one(arr)
  return [1] if arr.empty?

  arr[-1] += 1

  if arr[-1] == 10
    arr[-1] = 0
    plus_one(arr[0...-1]) + [arr[-1]]
  else
    arr[0...-1] + [arr[-1]]
  end
end

describe "#plus_one" do
  def assert_plus_one(arr)
    expectation = (arr.join.to_i + 1).to_s.split("").map(&:to_i)
    result = plus_one(arr)

    assert_equal(expectation, result)
  end

  it "adds one to an array representing a number" do
    assert_plus_one([1, 2, 3])
    assert_plus_one([1, 2, 0])
    assert_plus_one([2, 0])
    assert_plus_one([2, 0, 0, 2])
  end

  it "adds one to number arrays with a 9 in the ones place" do
    assert_plus_one([9])
    assert_plus_one([1, 9])
    assert_plus_one([2, 9, 9, 9])
    assert_plus_one([2, 9, 8, 9])
  end
end
