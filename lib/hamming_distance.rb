require "minitest/autorun"
require "byebug"

# PROMPT
=begin
The Hamming distance between two integers is the number of positions at which the corresponding bits are different.

Given two integers x and y, calculate the Hamming distance.

Note:
0 ≤ x, y < 231.

Example:

Input: x = 1, y = 4

Output: 2

Explanation:
1   (0 0 0 1)
4   (0 1 0 0)
       ↑   ↑

The above arrows point to positions where the corresponding bits are different.
=end

# SIMPLE SOLUTION: Time O(n), Space O(n)
# the solution is XORing x and y, and counting how many 1's there are
def hamming_distance(x, y)
  to_b(x ^ y).chars.count { |char| char == "1" }
end

def to_b(num)
  quotient = num / 2
  remainder = num % 2
  bin = remainder.to_s

  until quotient == 0
    remainder = quotient % 2
    quotient /= 2
    bin = remainder.to_s + bin
  end

  bin
end

describe "#to_b" do
  it "converts the string to a binary number" do
    256.times { |num| assert_equal(num.to_s(2), to_b(num)) }
  end
end

describe "#hamming_distance" do
  it "solves the problem prompt" do
    assert_equal(2, hamming_distance(1, 4))
    assert_equal(2, hamming_distance(93, 73))
  end
end
