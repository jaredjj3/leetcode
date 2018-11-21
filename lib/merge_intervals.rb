require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given a collection of intervals, merge all overlapping intervals.

Example 1:

Input: [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]
Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
Example 2:

Input: [[1,4],[4,5]]
Output: [[1,5]]
Explanation: Intervals [1,4] and [4,5] are considerred overlapping.
=end

class Interval
  attr_accessor :start, :end

  def initialize(s = 0, e = 0)
    @start = s
    @end = e
  end

  def to_a
    [self.start, self.end]
  end
end

def merge(intervs)
  intervs
end

describe "#merge" do
  def to_intervs(arr)
    arr.map { |(s, e)| Interval.new(s, e) }
  end

  def to_a(intervs)
    intervs.map(&:to_a)
  end

  def assert_merge(exp_arr, input_arr)
    intervs = to_intervs(input_arr)
    merged_intervs = merge(intervs)
    assert_equal(exp_arr, to_a(merged_intervs))
  end

  it "merges two intervals that are sorted by start" do
    assert_merge([[0, 6]], [[0, 4], [3, 6]])
  end

  it "merges two intervals that are not sorted" do
    assert_merge([[0, 6]], [[3, 6], [0, 4]])
  end

  it "merges many intervals" do
    assert_merge([[1, 6], [8, 10], [15, 18]], [[1, 3], [2, 6], [8, 10], [15, 18]])
  end
end
