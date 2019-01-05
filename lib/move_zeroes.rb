require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

Example:

Input: [0,1,0,3,12]
Output: [1,3,12,0,0]
Note:

You must do this in-place without making a copy of the array.
Minimize the total number of operations.

=end

def move_zeroes(nums)
  seen = 0
  ndx = 0

  while seen < nums.size
    if nums[ndx] == 0
      nums.delete_at(ndx)
      nums << 0
    else
      ndx += 1
    end

    seen += 1
  end

  nums
end

describe "#move_zeroes" do
  it "solves the problem prompt" do
    assert_equal([],                  move_zeroes([]))
    assert_equal([1],                 move_zeroes([1]))
    assert_equal([1, 0],              move_zeroes([0, 1]))
    assert_equal([0],                 move_zeroes([0]))
    assert_equal([1, 2, 31, 1, 0],    move_zeroes([1, 2, 31, 0, 1]))
    assert_equal([1, 2, 31, 1, 0, 0], move_zeroes([1, 2, 31, 0, 0, 1]))
    assert_equal([1, 3, 12, 0, 0],    move_zeroes([0, 1, 0, 3, 12]))
  end
end
