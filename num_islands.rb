require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

Example 1:

Input:
11110
11010
11000
00000

Output: 1
Example 2:

Input:
11000
11000
00100
00011

Output: 3
=end

def visit(grid, row_ndx, col_ndx)
  return nil if row_ndx < 0 || col_ndx < 0
  row = grid[row_ndx]

  return nil if row.nil?

  node = row[col_ndx]
  row[col_ndx] = "0"
  node
end

def explore(grid, row_ndx, col_ndx)
  return unless visit(grid, row_ndx, col_ndx) == "1"

  explore(grid, row_ndx - 1, col_ndx)
  explore(grid, row_ndx + 1, col_ndx)
  explore(grid, row_ndx, col_ndx - 1)
  explore(grid, row_ndx, col_ndx + 1)
end

def num_islands(grid)
  num = 0

  dup_grid = grid.map { |row| row.dup }

  dup_grid.each.with_index do |row, row_ndx|
    row.each.with_index do |el, col_ndx|
      next unless el == "1"
      explore(dup_grid, row_ndx, col_ndx)
      num += 1
    end
  end

  num
end

describe "#num_islands" do
  it "solves the problem prompt" do
    grid1 = [
      ["1", "1", "1", "1", "0"],
      ["1", "1", "0", "1", "0"],
      ["1", "1", "0", "0", "0"],
      ["0", "0", "0", "0", "0"]
    ]
    assert_equal(1, num_islands(grid1))

    grid2 = [
      ["1", "1", "0", "0", "0"],
      ["1", "1", "0", "0", "0"],
      ["0", "0", "1", "0", "0"],
      ["0", "0", "0", "1", "1"]
    ]
    assert_equal(3, num_islands(grid2))

    grid3 = [
      ["1","1","1","1","0"],
      ["1","1","0","1","0"],
      ["1","1","0","0","0"],
      ["0","0","0","0","0"]
    ]
    assert_equal(1, num_islands(grid3))

    grid4 = [["1"]]
    assert_equal(1, num_islands(grid4))

    grid5 = [["1","1","1"],["0","1","0"],["1","1","1"]]
    assert_equal(1, num_islands(grid5))
  end
end
