require_relative "../data_structures/data_structures.rb"

# SESSION
# 1

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
  return 0 if prices.empty?

  max = -Float::INFINITY
  maxes = Array.new(prices.size)
  ndx = prices.size - 1
  while ndx >= 0
    price = prices[ndx]
    max = [max, price].max
    maxes[ndx] = max
    ndx -= 1
  end

  min = Float::INFINITY
  mins = Array.new(prices.size)
  ndx = 0
  while ndx < prices.size
    price = prices[ndx]
    min = [min, price].min
    mins[ndx] = min
    ndx += 1
  end

  profits = Array.new(prices.size)
  ndx = 0
  while ndx < prices.size
    profits[ndx] = maxes[ndx] - mins[ndx]
    ndx += 1
  end

  profits.max
end
