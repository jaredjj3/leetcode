require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), determine if a person could attend all meetings.

Example 1:

Input: [[0,30],[5,10],[15,20]]
Output: false
Example 2:

Input: [[7,10],[2,4]]
Output: true
=end

class Interval
  attr_accessor :start, :end

  def initialize(s = 0, e = 0)
    @start = s
    @end = e
  end
end

def can_attend_meetings(intervals)
end

describe "#can_attend_meetings" do
  it "returns true if no intervals overlap" do 
    assert(can_attend_meetings([Interval.new(0, 2), Interval.new(3, 4)]))
    assert(can_attend_meetings([Interval.new(0, 2), Interval.new(3, 4), Interval.new(5, 6)]))
  end

  it "returns false if intervals overlap" do
    refute(can_attend_meetings([Interval.new(0, 2), Interval.new(1, 4)]))
    refute(can_attend_meetings([Interval.new(1, 5), Interval.new(2, 4)]))
  end
end
