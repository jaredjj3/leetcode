require "minitest/autorun"
require "byebug"
require "set"

# PROMPT
=begin
Given an array of strings, group anagrams together.

Example:

Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
Output:
[
  ["ate","eat","tea"],
  ["nat","tan"],
  ["bat"]
]
Note:

All inputs will be in lowercase.
The order of your output does not matter.
=end

def group_anagrams(arr)
  arr.group_by { |str| str.split("").sort }.values
end

# def group_anagrams(arr)
#   arr.group_by { |str| freq_hash(str.chars) }.values
# end

# def freq_hash(arr)
#   arr.each.with_object(Hash.new { |h, k| h[k] = 0 }) { |el, hash| hash[el] += 1 }
# end

describe "#group_anagrams" do
  def assert_group_anagrams(exp, arr)
    assert_equal(
      exp.map(&:to_set).to_set,
      group_anagrams(arr).map(&:to_set).to_set
    )
  end

  it "groups the same strings together" do
    assert_group_anagrams(
      [
        %W(a a a),
        %W(b b b),
        %W(c c c)
      ],
      %W(a b c a b c a b c)
    )
  end

  it "groups more complex examples" do
    assert_group_anagrams(
      [
        ["ate","eat","tea"],
        ["nat","tan"],
        ["bat"]
      ],
      ["eat", "tea", "tan", "ate", "nat", "bat"]
    )
  end
end
