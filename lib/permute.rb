require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Given a collection of distinct integers, return all possible permutations.

Example:

Input: [1,2,3]
Output:
[
  [1,2,3],
  [1,3,2],
  [2,1,3],
  [2,3,1],
  [3,1,2],
  [3,2,1]
]
=end

def permute(nums)
  return [[]] if nums.empty?

  nums.flat_map.with_index do |probe, ndx|
    dup_nums = nums.dup
    dup_nums.slice!(ndx)
    perms = permute(dup_nums)
    perms.map { |perm| perm << probe }
  end
end


describe "#permute" do
  it "solves the problem prompt" do
    flunk
  end
end
