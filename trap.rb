require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.
=end

def do_trap(heights)
  l_ndx = 0
  l_max = 0
  r_max = 0
  r_ndx = 0
  water = 0

  while (l_ndx <= r_ndx)
    left = heights[l_ndx]
    right = heights[r_ndx]

    if left >= right
      if left >= l_max
        l_max = left
      else
        water += l_max - left
      end

      l_ndx += 1
    else
      if right >= r_max
        r_max = right
      else
        water += r_max - right
      end

      r_ndx -= 1
    end
  end

  water
end

describe "#trap" do
  it "solves the problem prompt" do
    assert_equal(6, do_trap([0,1,0,2,1,0,1,3,2,1,2,1]))
    assert_equal(0, do_trap([0,2,0]))
    assert_equal(1, do_trap([4,2,3]))
  end
end
