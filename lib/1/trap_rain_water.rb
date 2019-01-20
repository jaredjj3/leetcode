require_relative "../data_structures/data_structures.rb"

# SESSION
# 1

# PROMPT
=begin
Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.

The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped. Thanks Marcos for contributing this image!

Example:

Input: [0,1,0,2,1,0,1,3,2,1,2,1]
Output: 6
=end

def trap_rain_water(heights)
  res = 0
  ndx = 0

  while ndx < heights.size - 1
    next ndx += 1 if heights[ndx] == 0 || heights[ndx + 1] >= heights[ndx]

    l_ndx = ndx
    r_ndx = ndx + 1

    while r_ndx < heights.size - 1 && heights[r_ndx] < heights[l_ndx]
      r_ndx += 1
    end

    res += area(heights, l_ndx, r_ndx)

    ndx = r_ndx
  end

  res
end

def area(heights, lb, rb)
  ub = [heights[lb], heights[rb]].min
  heights[(lb + 1)...rb].reduce(0) { |area, height| area + ub - height }
end
