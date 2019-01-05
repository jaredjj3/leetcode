require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given two binary strings, return their sum (also a binary string).

The input strings are both non-empty and contains only characters 1 or 0.

Example 1:

Input: a = "11", b = "1"
Output: "100"
Example 2:

Input: a = "1010", b = "1011"
Output: "10101"
=end

def add_binary(raw_a, raw_b)
  a = raw_a.to_i(2)
  b = raw_b.to_i(2)

  sum = a ^ b
  carry = a & b

  until carry == 0
    shifted = carry << 1
    carry = sum & shifted
    sum = sum ^ shifted
  end

  sum.to_s(2)
end

describe "#add_binary" do
  it "solves simple cases" do
    assert_equal("1", add_binary("0", "1"))
  end

  it "can carry ones correctly" do
    assert_equal("10", add_binary("01", "01"))
  end

  it "solves the problem prompt" do
    assert_equal("10101", add_binary("1010", "1011"))
    assert_equal("100", add_binary("11", "1"))
  end

  it "solves adding 1..100 to itself" do
    (1..100).each do |i|
      b = i.to_s(2)
      assert_equal((i + i).to_s(2), add_binary(b, b))
    end
  end
end
