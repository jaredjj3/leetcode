require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Write a function that takes a string as input and returns the string reversed.

Example 1:

Input: "hello"
Output: "olleh"
Example 2:

Input: "A man, a plan, a canal: Panama"
Output: "amanaP :lanac a ,nalp a ,nam A"
=end

def reverse_string(str)
end

describe "#reverse_string" do
  it "solves the problem prompt" do
    %W(
      foo
      bar
      baz
      bam
      asdf
      sdafgsdgdsg
      wefewfewqfkewnfejkwf
      3r
      2r32r23r32r32r
      23
      r23fwefsgof
    ).each do |str|
      assert_equal(str.reverse, reverse_string(str))
    end
  end
end
