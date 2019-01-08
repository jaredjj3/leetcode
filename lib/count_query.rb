require "minitest/autorun"

#
# Write a method #count_query that returns the number of 1s in a subgrid of a given
# grid that exists in memory.
#
# 0 0 0 1
# 1 0 1 0
# 1 1 1 0
#
# The grid is large, but can be loaded into memory.

class Solution
  # The grid used for tests and in ::CACHED_GRID.
  GRID = [
    [0, 0, 0, 1],
    [1, 0, 1, 0],
    [1, 1, 1, 0]
  ].freeze

  # A grid that reduces ::GRID into arrays of running sums in the row direction.
  CACHED_GRID = [].tap do |grid|
    GRID.each.with_index do |row, r_ndx|
      grid << []
      row.each.with_index do |el, c_ndx|
        left = c_ndx == 0 ? 0 : grid[r_ndx][c_ndx - 1]
        grid[r_ndx] << el + left
      end
    end
  end

  # This method takes the running sums grid (aka ::CACHED_GRID),
  # iterates over each row in r0..r1, and computes the sum of all
  # of the row's values at c1.
  #
  # Let n be the number of elements in ::GRID
  # Time complexity O(n)
  # Space complexity O(1) if we compute ::CACHED_GRID in-place, O(n) otherwise
  #
  # @param {Integer} r0 the beginning of the subgrid's row range
  # @param {Integer} r1 the end of the subgrid's rowrange (inclusive)
  # @param {Integer} c0 the beginning of the subgrid's col range
  # @param {Integer} c1 the end of the subgrid's col range (inclusive)
  # @returns {Integer} the number of 1s in the subgrid
  def self.count_query(r0, r1, c0, c1)
    CACHED_GRID[r0..r1].reduce(0) { |sum, row| sum + row[c1] - (c0 == 0 ? 0 : row[c0 - 1]) }
  end
end

describe "Solution" do
  describe "::CACHED_GRID" do
    it "returns a grid of running sums in the row direction using ::GRID" do
      assert_equal(
        [
          [0, 0, 0, 1],
          [1, 1, 2, 2],
          [1, 2, 3, 3]
        ],
        Solution::CACHED_GRID
      )
    end
  end

  describe "::count_query" do
    it "returns the number of 1s in the subgrid spec" do
      [
        [0, [0, 0, 0, 0]],
        [1, [0, 0, 0, 3]],
        [0, [0, 0, 0, 2]],
        [6, [0, 2, 0, 3]],
        [2, [0, 2, 0, 0]],
        [5, [0, 2, 0, 2]],
        [0, [1, 1, 1, 1]],
        [3, [0, 2, 1, 2]]
      ].each { |(exp, args)| assert_equal(exp, Solution.count_query(*args)) }
    end
  end
end
