require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

Example 1:

Input: "babad"
Output: "bab"
Note: "aba" is also a valid answer.
Example 2:

Input: "cbbd"
Output: "bb"
=end

def longest_palindrome(str)
  return "" if str.empty?
  longest = str[0]

  (str.length - 1).times do |ndx|
    [ndx, ndx..(ndx + 1)].each do |root_indexer|
      root = str[root_indexer]
      next if root != root.reverse

      indexer = root_indexer
      indexer = next_indexer(indexer) while expansion_matches?(str, indexer)
      longest = [str[indexer], longest].max_by(&:length)
    end
  end

  puts

  longest
end

def fetch(arr, ndx)
  ndx < 0 ? nil : arr[ndx]
end

def expansion_matches?(arr, indexer)
  case indexer
  when Range
    range = indexer
    left = fetch(arr, range.begin - 1)
    right = fetch(arr, range.end + 1)
    !left.nil? && left == right
  when Integer
    ndx = indexer
    left = fetch(arr, ndx - 1)
    right = fetch(arr, ndx + 1)
    !left.nil? && left == right
  end
end

def next_indexer(indexer, offset = 1)
  case indexer
  when Range
    (indexer.begin - offset)..(indexer.end + offset)
  when Integer
    (indexer - offset)..(indexer + offset)
  end
end

describe "#longest_palindrome" do
  it "solves the problem prompt" do
    assert(["bab", "aba"].include?(longest_palindrome("babad")))
    assert_equal("bb", longest_palindrome("cbbd"))
    assert_equal("bbabb", longest_palindrome("abbabb"))
    assert_equal("a", longest_palindrome("a"))
  end
end
