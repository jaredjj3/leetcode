require_relative "../data_structures/data_structures.rb"

# SESSION
# 1

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
  ndx = 0
  times = 0

  while times < nums.size
    if nums[ndx] == 0
      nums.delete_at(ndx)
      nums << 0
    else
      ndx += 1
    end

    times += 1
  end

  nil
end
