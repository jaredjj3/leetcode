require "minitest/autorun"
require "byebug"

# PROMPT
=begin

Given two integers dividend and divisor, divide two integers without using multiplication, division and mod operator.

Return the quotient after dividing dividend by divisor.

The integer division should truncate toward zero.

Example 1:

Input: dividend = 10, divisor = 3
Output: 3
Example 2:

Input: dividend = 7, divisor = -3
Output: -2
Note:

Both dividend and divisor will be 32-bit signed integers.
The divisor will never be 0.
Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 231 − 1 when the division result overflows.
=end

def divide(dividend, divisor)
  
end

describe "#divide" do
  it "solves the problem prompt" do
    nums = [*-100..100].reject { |n| n == 0 }
    
    100.times do
      dividend = nums.sample
      divisor = nums.sample
      assert_equal(dividend / divisor, divide(dividend, divisor))
    end
  end
end
