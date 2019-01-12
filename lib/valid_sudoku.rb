# PROMPT
=begin
Determine if a 9x9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

Each row must contain the digits 1-9 without repetition.
Each column must contain the digits 1-9 without repetition.
Each of the 9 3x3 sub-boxes of the grid must contain the digits 1-9 without repetition.

A partially filled sudoku which is valid.

The Sudoku board could be partially filled, where empty cells are filled with the character '.'.
=end

def valid_sudoku(board)
  rows_valid?(board) && columns_valid?(board) && boxes_valid?(board)
end

def rows_valid?(board)
  board.all?(&method(:valid_entity?))
end

def columns_valid?(board)
  rows_valid?(board.transpose)
end

def boxes_valid?(board)
  ranges = [0..2, 3..5, 6..8]

  ranges.product(ranges).all? do |rows, cols|
    valid_entity?(board[rows].flat_map { |row| row[cols] })
  end
end

def valid_entity?(arr)
  sanitized = arr.reject { |el| el == "." }
  sanitized.size == sanitized.uniq.size
end