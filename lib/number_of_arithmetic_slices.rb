require "minitest/autorun"
require "byebug"

# PROMPT
=begin
A sequence of number is called arithmetic if it consists of at least three elements and if the difference between any two consecutive elements is the same.

For example, these are arithmetic sequence:

1, 3, 5, 7, 9
7, 7, 7, 7
3, -1, -5, -9
The following sequence is not arithmetic.

1, 1, 2, 5, 7

A zero-indexed array A consisting of N numbers is given. A slice of that array is any pair of integers (P, Q) such that 0 <= P < Q < N.

A slice (P, Q) of array A is called arithmetic if the sequence:
A[P], A[p + 1], ..., A[Q - 1], A[Q] is arithmetic. In particular, this means that P + 1 < Q.

The function should return the number of arithmetic slices in the array A.


Example:

A = [1, 2, 3, 4]

return: 3, for 3 arithmetic slices in A: [1, 2, 3], [2, 3, 4] and [1, 2, 3, 4] itself.
=end

def number_of_arithmetic_slices(arr)
  count = 0
  streak = 0

  arr.each_index do |ndx|
    next if ndx < 2

    if arr[ndx] - arr[ndx - 1] == arr[ndx - 1] - arr[ndx - 2]
      streak += 1
      count += streak
    else
      streak = 0
    end
  end

  count
end

describe "#number_of_arithmetic_slices" do
  it "solves the problem prompt" do
    assert_equal(3, number_of_arithmetic_slices([1, 2, 3, 4]))
  end
end
