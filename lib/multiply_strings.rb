require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.

Example 1:

Input: num1 = "2", num2 = "3"
Output: "6"
Example 2:

Input: num1 = "123", num2 = "456"
Output: "56088"
Note:

The length of both num1 and num2 is < 110.
Both num1 and num2 contain only digits 0-9.
Both num1 and num2 do not contain any leading zero, except the number 0 itself.
You must not use any built-in BigInteger library or convert the inputs to integer directly.
=end

def multiply_strings(n1, n2)
  smaller, larger = [n1, n2].sort.map { |str| str.to_i.to_s(2) }
end

describe "#multiply_strings" do
  it "works on a large sample of numbers" do
    100.times do
      n1 = rand(0..100)
      n2 = rand(0..100)

      exp = (n1 * n2).to_s
      assert_equal(exp, multiply_strings(n1.to_s, n2.to_s))
    end
  end
end
