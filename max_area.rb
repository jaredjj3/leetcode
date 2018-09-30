require "minitest/autorun"

# PROMPT
=begin
Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.

Note: You may not slant the container and n is at least 2.

Example:

Input: [1,8,6,2,5,4,8,3,7]
Output: 49
=end

def max_area(heights)
  areas = []

  left_ndx = 0
  right_ndx = heights.size - 1
  while left_ndx < right_ndx
    width = right_ndx - left_ndx
    height = [heights[left_ndx], heights[right_ndx]].min
    areas << width * height

    if heights[left_ndx] <= heights[right_ndx]
      left_ndx += 1
    else
      right_ndx -= 1
    end
  end

  areas.max
end

describe "#max_area" do
  it "solves the problem prompt" do
    assert_equal(49, max_area([1, 8, 6, 2, 5, 4, 8, 3, 7]))
  end
end
