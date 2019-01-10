require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Implement atoi which converts a string to an integer.

The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.

The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.

If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.

If no valid conversion could be performed, a zero value is returned.

Note:

Only the space character ' ' is considered as whitespace character.
Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. If the numerical value is out of the range of representable values, INT_MAX (231 − 1) or INT_MIN (−231) is returned.
Example 1:

Input: "42"
Output: 42
Example 2:

Input: "   -42"
Output: -42
Explanation: The first non-whitespace character is '-', which is the minus sign.
             Then take as many numerical digits as possible, which gets 42.
Example 3:

Input: "4193 with words"
Output: 4193
Explanation: Conversion stops at digit '3' as the next character is not a numerical digit.
Example 4:

Input: "words and 987"
Output: 0
Explanation: The first non-whitespace character is 'w', which is not a numerical 
             digit or a +/- sign. Therefore no valid conversion could be performed.
Example 5:

Input: "-91283472332"
Output: -2147483648
Explanation: The number "-91283472332" is out of the range of a 32-bit signed integer.
             Thefore INT_MIN (−231) is returned.
=end

MIN = -2**31
MAX = 2**31 - 1
VALID = [*0..9].map(&:to_s).to_set.freeze

def atoi(str)
  buffer = []

  str.each_char do |char|
    if char == "+" || char == "-"
      break if buffer.any?
      buffer << char
    elsif VALID.include?(char)
      buffer << char
    elsif char == " "
      break if buffer.any?
    else
      return 0 if buffer.empty?
      break
    end
  end

  num = buffer.join("").to_i
  num = [num, MAX].min
  num = [num, MIN].max
  num
end

describe "#atoi" do
  it "converts normal strings to numbers successfully" do
    assert_equal(42, atoi("42"))
  end

  it "handles leading whitespaces" do
    assert_equal(42, atoi("   42"))
  end

  it "handles trailing whitespaces" do
    assert_equal(42, atoi("42      "))
  end

  it "handles leading and trailing whitespaces" do
    assert_equal(42, atoi("      42      "))
  end

  it "retains + or - signs" do
    assert_equal(42, atoi("+42"))
    assert_equal(-42, atoi("-42"))
  end

  it "handles multiple positive signs" do
    assert_equal(0, atoi("++42"))
    assert_equal(0, atoi("+++42"))
  end

  it "handles multiple negative signs" do
    assert_equal(0, atoi("--42"))
    assert_equal(0, atoi("-+42"))
  end

  it "handles words after the number" do
    assert_equal(42, atoi("42 is my favorite number!11!oneone"))
  end

  it "returns 0 if the first non-whitespace character is not a number" do
    assert_equal(0, atoi("this should return 0, not 1"))
  end

  it "returns ::MIN if the string produces a number outside of a 32-bit signed integer" do
    assert_equal(MIN, atoi("-324238478392"))
  end

  it "returns ::MAX if the string produces a number outside of a 32-bit signed integer" do
    assert_equal(MAX, atoi("444442222222222"))
  end

  it "handles numbers separated by white spaces" do
    assert_equal(0, atoi("   +0 123"))
  end
end
