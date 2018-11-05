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

# Let p be the number of prices in +prices+
# O(n**2) time, O(1) space
# def max_profit(prices)
#   max = 0

#   prices.each.with_index do |buy_price, ndx|
#     prices[(ndx + 1)..-1].each do |sell_price|
#       profit = sell_price - buy_price
#       max = [max, profit].max
#     end
#   end

#   max
# end

# Let p be the number of prices in +prices+
# O(n) time, O(1) space
def max_profit(prices)
  max = 0
  min = Float::INFINITY

  prices.each do |price|
    min = [min, price].min
    max = [max, price - min].max
  end

  max
end

describe "#max_profit" do
  it "solves the problem prompt" do
    assert_equal(0, max_profit([7, 1]))
    assert_equal(6, max_profit([1, 7]))
    assert_equal(2, max_profit([1, 2, 3]))
    assert_equal(0, max_profit([3, 2, 1]))
    assert_equal(10, max_profit([6, 2, 3, 4, 2, 1, 11]))
    assert_equal(5, max_profit([7, 1, 5, 3, 6, 4]))
    assert_equal(2, max_profit([2, 1, 2, 1, 0, 1, 2]))
  end
end
