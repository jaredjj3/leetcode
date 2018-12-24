require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Write a program that outputs the string representation of numbers from 1 to n.

But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.
=end

def fizz_buzz(n)
  (1..n).map do |num|
    if num % 15 == 0
      "FizzBuzz"
    elsif num % 3 == 0
      "Fizz"
    elsif num % 5 == 0
      "Buzz"
    else
      num.to_s
    end
  end
end

describe "#fizz_buzz" do
  it "solves the problem prompt" do
    flunk
  end
end
