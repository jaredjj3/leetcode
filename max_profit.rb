require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Say you have an array for which the ith element is the price of a given stock on day i.

If you were only permitted to complete at most one transaction (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit.

Note that you cannot sell a stock before you buy one.

Example 1:

Input: [7,1,5,3,6,4]
Output: 5
Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
             Not 7-1 = 6, as selling price needs to be larger than buying price.
Example 2:

Input: [7,6,4,3,1]
Output: 0
Explanation: In this case, no transaction is done, i.e. max profit = 0.
=end

def max_profit(prices)
end

describe "#max_profit" do
  it "solves the problem prompt" do
    assert_equal(0, max_profit([7, 1]))
    assert_equal(6, max_profit([1, 7]))
    assert_equal(0, max_profit([1, 2, 3]))
    assert_equal(2, max_profit([3, 2, 1]))
    assert_equal(10, max_profit([6, 2, 3, 4, 2, 1, 11]))
  end
end
