require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Implement a method that returns the nth fibonacci number.
=end

# recursive
def fib(n, memo = {})
  return n if n < 2
  a = memo.fetch(n - 1) { fib(n - 1, memo) }
  b = memo.fetch(n - 2) { fib(n - 2, memo) }
  memo[n - 1] ||= a
  memo[n - 2] ||= b
  a + b
end

# iterative
# def fib(n)
#   return 0 if n == 0

#   a = 0
#   b = 1

#   [*2...n].each do
#     c = a + b
#     a = b
#     b = c
#   end

#   a + b
# end

describe "#fib" do
  it "solves the problem prompt" do
    assert_equal(144, fib(12))
    assert_equal(55, fib(10))
  end
end
