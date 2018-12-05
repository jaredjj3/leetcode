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

def add_binary(a, b)
  ndx = [a.size, b.size].max - 1
  res = ""
  carry_one = false

  while ndx >= 0
    ai = a[ndx]
    bi = b[ndx]

    if ai.nil?
      res << bi
      carry_one = false
    elsif bi.nil?
      res << ai
      carry_one = false
    else
      sum = ai.to_i + bi.to_i + (carry_one ? 1 : 0)
      carry_one = false

      if sum == 0
        res << "0"
      elsif sum == 1
        res << "1"
      elsif sum == 2
        res << "0"
        carry_one = true
      else
        # sum == 3
        res << "1"
        carry_one = true
      end
    end

    ndx -= 1
  end

  res << "1" if carry_one

  res.reverse
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
  end

  it "solves adding 1..100 to itself" do
    (1..100).each do |i|
      b = i.to_s(2)
      assert_equal((i + i).to_s(2), add_binary(b, b))
    end
  end
end
