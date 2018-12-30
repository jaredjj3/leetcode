require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given a non-empty array of integers, every element appears twice except for one. Find that single one.

Note:

Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

Example 1:

Input: [2,2,1]
Output: 1
Example 2:

Input: [4,1,2,1,2]
Output: 4
=end

def single_number(arr)
  key, val = freq_hash(arr).detect do |el, freq|
    freq == 1
  end

  key
end

def freq_hash(arr)
  hash = Hash.new { |h, k| h[k] = 0 }
  arr.each.with_object(hash) do |el, hash|
    hash[el] += 1
  end
end

describe "#single_number" do
  it "solves the problem prompt" do
    assert_equal(1, single_number([2, 2, 1]))
    assert_equal(4, single_number([4, 1, 2, 1, 2]))
  end
end
