require "minitest/autorun"

# You're given strings J representing the types of stones that are jewels, and S representing the stones you have.
# Each character in S is a type of stone you have.  You want to know how many of the stones you have are also jewels.

# The letters in J are guaranteed distinct, and all characters in J and S are letters.
# Letters are case sensitive, so "a" is considered a different type of stone from "A".

# Example 1:

# Input: J = "aA", S = "aAAbbbb"
# Output: 3
# Example 2:

# Input: J = "z", S = "ZZ"
# Output: 0
# Note:

# S and J will consist of letters and have length at most 50.
# The characters in J are distinct.

require "set"

# SOLUTION 1: O(n) time, O(n) space
#
# @param {String} j
# @param {String} s
# @return {Integer}
def num_jewels_in_stones(jewel, stones)
  jewels = jewel.chars.to_set

  stones.chars.reduce(0) do |sum, stone|
    sum += 1 if jewels.include?(stone)
    sum
  end
end

describe "#num_jewels_in_stones" do
  it "solves the examples" do
    assert_equal(3, num_jewels_in_stones("aA", "aAAbbbb"))
    assert_equal(0, num_jewels_in_stones("z", "ZZ"))
  end
end
