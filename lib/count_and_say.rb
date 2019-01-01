require "minitest/autorun"
require "byebug"

# PROMPT
=begin
The count-and-say sequence is the sequence of integers with the first five terms as following:

1.     1
2.     11
3.     21
4.     1211
5.     111221
1 is read off as "one 1" or 11.
11 is read off as "two 1s" or 21.
21 is read off as "one 2, then one 1" or 1211.

Given an integer n where 1 ≤ n ≤ 30, generate the nth term of the count-and-say sequence.

Note: Each term of the sequence of integers will be represented as a string.

 

Example 1:

Input: 1
Output: "1"
Example 2:

Input: 4
Output: "1211"
=end

def count_and_say(n)
  term = 1
  res = "1"

  until term == n
    res = say(count(res))
    term += 1
  end

  res
end

def count(str)
  chars = str.chars
  chars.each.with_object([]) do |char, count|
    curr = count.last && count.last.last

    if curr.nil? || curr != char
      count << [char]
    else
      count.last << char
    end
  end
end

def say(arr)
  arr.map { |nums| "#{nums.size}#{nums.first}" }.join
end

describe "#count_and_say" do
  it "solves the problem prompt" do
    flunk
  end
end
