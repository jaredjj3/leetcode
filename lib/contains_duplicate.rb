require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given an array of integers, find if the array contains any duplicates.

Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.

Example 1:

Input: [1,2,3,1]
Output: true
Example 2:

Input: [1,2,3,4]
Output: false
Example 3:

Input: [1,1,1,3,3,4,3,2,4,2]
Output: true
=end

def contains_duplicate(nums)
  nums.size != nums.uniq.size
end

describe "#contains_duplicate" do
  it "returns true if there are duplicates" do
    assert(contains_duplicate([1, 1, 2, 3]))
    assert(contains_duplicate([1, 3, 2, 3]))
    assert(contains_duplicate([4, 3, 2, 3]))
  end

  it "returns false if every element is distinct" do
    refute(contains_duplicate([1, 2, 3]))
    refute(contains_duplicate([1, 4, 3]))
    refute(contains_duplicate([5, 2, 3]))
  end
end
