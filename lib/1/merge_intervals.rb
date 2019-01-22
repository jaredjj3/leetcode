require_relative "../data_structures/data_structures.rb"

# SESSION
# 1

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
Explanation: Intervals [1,4] and [4,5] are considered overlapping.
=end

def merge_intervals(intervals)
  intervals.sort_by!(&:start)

  merged = []

  intervals.each do |interval|
    if merged.empty?
      merged << interval
    elsif merged.last.end >= interval.start
      merged.last.end = [merged.last.end, interval.end].max
    else
      merged << interval
    end
  end

  merged
end
