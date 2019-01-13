require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Convert a non-negative integer to its english words representation. Given input is guaranteed to be less than 231 - 1.

Example 1:

Input: 123
Output: "One Hundred Twenty Three"
Example 2:

Input: 12345
Output: "Twelve Thousand Three Hundred Forty Five"
Example 3:

Input: 1234567
Output: "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"
Example 4:

Input: 1234567891
Output: "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"

=end

LT_20 = %W(One Two Three Four Five Six Seven Eight Nine Ten Eleven Twelve Thirteen Fourteen Fifteen Sixteen Seventeen Eighteen Nineteen).freeze
TENS = %W(Ten Twenty Thirty Forty Fifty Sixty Seventy Eighty Ninety).freeze
THOUSANDS = %W(Thousand Million Billion)

def number_to_words(number)
  return "Zero" if number == 0

  words = []

  number.
      to_s.
      reverse.
      chars.
      each_slice(3).
      map { |slice| slice.reverse.join.to_i }.
      each.with_index do |lt_1000, ndx|
        thou = ndx > 0 ? "#{THOUSANDS.fetch(ndx - 1)}" : ""
        words.unshift(say_up_to_999(lt_1000), thou) if lt_1000 > 0
      end

  words.reject(&:empty?).join(" ")
end

def say_up_to_19(number)
  number == 0 ? "" : LT_20.fetch(number - 1)
end

def say_20_to_99(number)
  tens = number / 10
  ones = number - (tens * 10) / 1
  "#{TENS.fetch(tens - 1)}#{ones > 0 ? " #{say_up_to_19(ones)}" : ""}"
end

def say_up_to_99(number)
  (0..19).include?(number) ? say_up_to_19(number) : say_20_to_99(number)
end

def say_up_to_999(number)
  hundreds = number / 100
  rest = number - (hundreds * 100)
  "#{hundreds > 0 ? "#{say_up_to_99(hundreds)} Hundred " : ""}#{say_up_to_99(rest)}".strip
end

describe "#number_to_words" do
  it "solves the problem prompt" do
    assert_equal("Zero", number_to_words(0))
    assert_equal("One", number_to_words(1))
    assert_equal("One Hundred", number_to_words(100))
    assert_equal("One Hundred Twenty Three", number_to_words(123))
    assert_equal("Nine Hundred Eighty Nine", number_to_words(989))
    assert_equal("Twenty Nine", number_to_words(29))
    assert_equal("Twenty", number_to_words(20))
    assert_equal("Twelve", number_to_words(12))
    assert_equal("One Thousand", number_to_words(1000))
    assert_equal("One Thousand Six", number_to_words(1006))
    assert_equal("Twelve Thousand Three Hundred Forty Five", number_to_words(12345))
    assert_equal("One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven", number_to_words(1234567))
    assert_equal("One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One", number_to_words(1234567891))
  end
end
