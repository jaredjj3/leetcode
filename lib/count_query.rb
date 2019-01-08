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

  # A grid that transforms ::GRID into a grid of running sums in the
  # col then row directions.
  CACHED_GRID = [].tap do |grid|
    # Column running sum
    GRID.each.with_index do |row, r_ndx|
      grid << []
      row.each.with_index do |el, c_ndx|
        up = r_ndx == 0 ? 0 : grid[r_ndx - 1][c_ndx]
        grid[r_ndx] << el + up
      end
    end

    # Row running sum
    grid.each.with_index do |row, r_ndx|
      row.each.with_index do |el, c_ndx|
        left = c_ndx == 0 ? 0 : grid[r_ndx][c_ndx - 1]
        grid[r_ndx][c_ndx] = el + left
      end
    end
  end

  # This method takes the running sums grid (::CACHED_GRID),
  # and takes the number in the bottom-right corner (probe) of the subgrid,
  # which is the running sum in the column and row directions. It
  # then takes the running sums above the probe and to the left of the probe
  # and subtracts it from the final count. Finally, it readds the
  # elements that were subtracted twice.
  #
  # Let n be the number of elements in ::GRID
  # Time complexity O(1)
  # Space complexity O(1) if we compute ::CACHED_GRID in-place, O(n) otherwise
  #
  # @param {Integer} r0 the beginning of the subgrid's row range
  # @param {Integer} r1 the end of the subgrid's row range (inclusive)
  # @param {Integer} c0 the beginning of the subgrid's col range
  # @param {Integer} c1 the end of the subgrid's col range (inclusive)
  # @returns {Integer} the number of 1s in the subgrid
  def self.count_query(r0, r1, c0, c1)
    # Running sums in the row and column directions
    count = CACHED_GRID[r1][c1]

    # Subtract the running sums above
    count -= r0 == 0 ? 0 : CACHED_GRID[r0 - 1][c1]

    # Subtract the running sums to the left
    count -= c0 == 0 ? 0 : CACHED_GRID[r1][c0 - 1]

    # Readd elements that were double subtracted
    count += r0 == 0 || c0 == 0 ? 0 : CACHED_GRID[r0 - 1][c0 - 1]

    count
  end
end

describe "Solution" do
  describe "::CACHED_GRID" do
    it "returns a grid of running sums in the row direction using ::GRID" do
      assert_equal(
        [
          [0, 0, 0, 1],
          [1, 1, 2, 3],
          [2, 3, 5, 6]
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
        [3, [0, 2, 1, 2]],
        [5, [1, 2, 0, 2]]
      ].each { |(exp, args)| assert_equal(exp, Solution.count_query(*args)) }
    end
  end
end
