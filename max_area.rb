require "minitest/autorun"

# PROMPT
=begin
Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.

Note: You may not slant the container and n is at least 2.

Example:

Input: [1,8,6,2,5,4,8,3,7]
Output: 49
=end

Height = Struct.new(:height, :ndx)

# Naive solution: O(n**2) time, O(n**2) space
def max_area(heights)
  height_structs = heights.map.with_index { |height, ndx| Height.new(height, ndx) }

  areas = heights.flat_map.with_index do |height, ndx|
    structs = height_structs.dup
    structs.delete_at(ndx)
    structs.map do |struct|
      length = (struct.ndx - ndx).abs
      container_height = [struct.height, height].min.abs
      length * container_height
    end
  end

  areas.max
end

describe "#max_area" do
  it "solves the problem prompt" do
    assert_equal(49, max_area([1, 8, 6, 2, 5, 4, 8, 3, 7]))
  end
end
