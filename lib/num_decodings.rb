require "minitest/autorun"
require "byebug"
require "set"

# PROMPT
=begin
A message containing letters from A-Z is being encoded to numbers using the following mapping:

'A' -> 1
'B' -> 2
...
'Z' -> 26
Given a non-empty string containing only digits, determine the total number of ways to decode it.

Example 1:

Input: "12"
Output: 2
Explanation: It could be decoded as "AB" (1 2) or "L" (12).
Example 2:

Input: "226"
Output: 3
Explanation: It could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).
=end

VALID_TOKEN_RANGE = (1..26)

def num_decodings(str)
  base = base_decoding(str)
  return 0 if base.empty? || base.any? { |char| char == "0" }
  1 + decodings(base).size
end

def base_decoding(str)
  str.chars.each.with_object([]).with_index do |(char, base), ndx|
    next if char == "0" && ndx > 0

    if (char == "1" || char == "2") && char[ndx + 1] == "0"
      base << "#{char}0"
    else
      base << char
    end
  end
end

def decodings(arr)
  set = Set.new

  arr.each_cons(2).with_index do |(char1, char2), ndx|
    char = char1 + char2
    if VALID_TOKEN_RANGE.include?(char.to_i)
      spliced = splice(arr, char, ndx)
      set.add(spliced)
      set = set | decodings(spliced)
    end
  end

  set
end

def splice(arr, str, ndx)
  raise ArgumentError unless str.size == 2
  raise ArgumentError unless ndx >= 0
  raise ArgumentError unless ndx < arr.size - 1

  arr.dup.tap do |dup_arr|
    dup_arr[ndx] = str
    dup_arr.delete_at(ndx + 1)
  end
end

describe "#num_decodings" do
  it "solves simple examples" do
    assert_equal(2, num_decodings("12"))
    assert_equal(1, num_decodings("1"))
    assert_equal(1, num_decodings("10"))
  end

  it "returns 0 if the string is invalid" do
    assert_equal(0, num_decodings("0"))
    assert_equal(0, num_decodings(""))
    assert_equal(0, num_decodings("012"))
    assert_equal(0, num_decodings("01"))
    assert_equal(0, num_decodings("010"))
  end

  it "solves more complex examples" do
    assert_equal(3, num_decodings("226"))
    assert_equal(5, num_decodings("2116"))
  end
end
