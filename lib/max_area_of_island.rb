require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given a non-empty 2D array grid of 0's and 1's, an island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.

Find the maximum area of an island in the given 2D array. (If there is no island, the maximum area is 0.)

Example 1:

[[0,0,1,0,0,0,0,1,0,0,0,0,0],
 [0,0,0,0,0,0,0,1,1,1,0,0,0],
 [0,1,1,0,1,0,0,0,0,0,0,0,0],
 [0,1,0,0,1,1,0,0,1,0,1,0,0],
 [0,1,0,0,1,1,0,0,1,1,1,0,0],
 [0,0,0,0,0,0,0,0,0,0,1,0,0],
 [0,0,0,0,0,0,0,1,1,1,0,0,0],
 [0,0,0,0,0,0,0,1,1,0,0,0,0]]
Given the above grid, return 6. Note the answer is not 11, because the island must be connected 4-directionally.
Example 2:

[[0,0,0,0,0,0,0,0]]
Given the above grid, return 0.
Note: The length of each dimension in the given grid does not exceed 50.
=end

def max_area_of_island(grid)
  max = 0
    grid.each.with_index do |row, ii|
      row.each.with_index do |el, jj|
        max = [max, explore(grid, ii, jj)].max if el == 1
      end
    end
  max
end

def explore(grid, ii, jj)
  return 0 if ii < 0 || jj < 0
  return 0 if (row = grid[ii]).nil?
  return 0 if (el = row[jj]).nil?
  return 0 if el == 0

  row[jj] = 0

  1 + explore(grid, ii - 1, jj) + explore(grid, ii, jj - 1) + explore(grid, ii + 1, jj) + explore(grid, ii, jj + 1)
end

describe "#max_area_of_island" do
  it "solves trivial grids" do
    assert_equal(0, max_area_of_island([[0]]))
    assert_equal(1, max_area_of_island([[1]]))
  end

  it "solves a somewhat large grid" do
    grid = [
      [0,0,1,0,0,0,0,1,0,0,0,0,0],
      [0,0,0,0,0,0,0,1,1,1,0,0,0],
      [0,1,1,0,1,0,0,0,0,0,0,0,0],
      [0,1,0,0,1,1,0,0,1,0,1,0,0],
      [0,1,0,0,1,1,0,0,1,1,1,0,0],
      [0,0,0,0,0,0,0,0,0,0,1,0,0],
      [0,0,0,0,0,0,0,1,1,1,0,0,0],
      [0,0,0,0,0,0,0,1,1,0,0,0,0]
    ]

    assert_equal(6, max_area_of_island(grid))
  end
end
