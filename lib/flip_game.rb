require "minitest/autorun"
require "byebug"

# PROMPT
=begin
You are playing the following Flip Game with your friend: Given a string that contains only these two characters: + and -, you and your friend take turns to flip two consecutive "++" into "--". The game ends when a person can no longer make a move and therefore the other person will be the winner.

Write a function to compute all possible states of the string after one valid move.

Example:

Input: s = "++++"
Output: 
[
  "--++",
  "+--+",
  "++--"
]
Note: If there is no valid move, return an empty list [].
=end

def flip_game(str)
  res = []
  chars = str.chars

  chars.each_cons(2).with_index do |(char1, char2), ndx|
    if char1 == "+" && char2 == "+"
      dup_chars = chars.dup
      dup_chars[ndx] = "-"
      dup_chars[ndx + 1] = "-"
      res << dup_chars.join
    end
  end

  res
end

describe "#flip_game" do
  it "solves the problem prompt" do
    flunk
  end
end
