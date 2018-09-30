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

def number_to_words(number)
end

describe "#number_to_words" do
  it "solves the problem prompt" do
    assert_equal("One Hundred Twenty Three", number_to_words(123))
    assert_equal("Twelve Thousand Three Hundred Forty Five", number_to_words(12345))
    assert_equal("One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven", number_to_words(1234567))
    assert_equal("One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One", number_to_words(1234567891))
  end
end
