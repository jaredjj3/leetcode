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
  merged = []

  lb = nil
  ub = nil

  intervs.sort_by(&:start).each.with_index do |interv, ndx|
    if (lb || ub).nil?
      lb = interv.start
      ub = interv.end
    elsif overlap?(Interval.new(lb, ub), interv)
      lb = [lb, interv.start].min
      ub = [ub, interv.end].max
    else
      merged << Interval.new(lb, ub)
      lb = interv.start
      ub = interv.end
    end

    if ndx == intervs.size - 1
      merged << Interval.new(lb, ub)
    end
  end

  merged
end

def overlap?(i1, i2)
  i2.start <= i1.end
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
    assert_merge([[1, 5]], [[1, 4], [4, 5]])
  end

  it "merges two intervals that are not sorted" do
    assert_merge([[0, 6]], [[3, 6], [0, 4]])
  end

  it "merges many intervals" do
    assert_merge([[1, 6], [8, 10]], [[1, 3], [2, 6], [8, 10]])
    assert_merge([[1, 6], [8, 10], [15, 18]], [[1, 3], [2, 6], [8, 10], [15, 18]])
  end
end
