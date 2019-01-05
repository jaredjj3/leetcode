require "minitest/autorun"
require "byebug"

# PROMPT
=begin
The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

P   A   H   N
A P L S I I G
Y   I   R
And then read line by line: "PAHNAPLSIIGYIR"

Write the code that will take a string and make this conversion given a number of rows:

string convert(string s, int numRows);
Example 1:

Input: s = "PAYPALISHIRING", numRows = 3
Output: "PAHNAPLSIIGYIR"
Example 2:

Input: s = "PAYPALISHIRING", numRows = 4
Output: "PINALSIGYAHRPI"
Explanation:

P     I    N
A   L S  I G
Y A   H R
P     I
=end

def convert(str, num_rows)
  return str if num_rows == 1

  num_pillars = (str.size / num_rows)
  num_cols = num_pillars + num_pillars * (num_rows - 2)
  grid = Array.new(num_rows) { Array.new(num_cols) }

  filling_col = true
  col_ndx = 0
  row_ndx = 0
  str.each_char do |char|
    if filling_col
      grid[row_ndx][col_ndx] = char
      
      filling_col = row_ndx < num_rows - 1
      
      if filling_col
        row_ndx += 1
      else
        row_ndx -= 1
        col_ndx += 1
      end
    else
      grid[row_ndx][col_ndx] = char

      filling_col = row_ndx == 0

      if filling_col
        row_ndx += 1
      else
        row_ndx -= 1
        col_ndx += 1
      end
    end
  end

  grid.map(&:compact).map(&:join).join
end

describe "#convert" do
  it "solves the problem prompt" do
    assert_equal("PAHNAPLSIIGYIR", convert("PAYPALISHIRING", 3))
    assert_equal("PINALSIGYAHRPI", convert("PAYPALISHIRING", 4))
  end

  it "solves failing tests" do
    assert_equal("ABC", convert("ABC", 1))
  end
end
