require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Implement strStr().

Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

Example 1:

Input: haystack = "hello", needle = "ll"
Output: 2
Example 2:

Input: haystack = "aaaaa", needle = "bba"
Output: -1
Clarification:

What should we return when needle is an empty string? This is a great question to ask during an interview.

For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().
=end

def str_str(haystack, needle)
  return 0 if needle.empty?

  ndx = 0
  while ndx <= (haystack.length - needle.length)
    bundle = haystack[ndx...(ndx + needle.length)]
    return ndx if bundle == needle
    ndx += 1
  end
  
  -1
end

describe "#str_str" do
  it "returns 0 when the needle is an empty string" do
    assert_equal(0, str_str("foo", ""))
  end

  it "returns the index of the first occurence of needle in haystack" do
    assert_equal(1, str_str("foo", "o"))
    assert_equal(1, str_str("foo", "oo"))
  end

  it "returns -1 if needle is not part of haystack" do
    assert_equal(-1, str_str("foo", "bar"))
    assert_equal(-1, str_str("foo", "foob"))
    assert_equal(-1, str_str("foot", "foob"))
    assert_equal(-1, str_str("foo", "fob"))
  end
end
