# PROMPT
=begin
Given a set of distinct integers, nums, return all possible subsets (the power set).

Note: The solution set must not contain duplicate subsets.

Example:

Input: nums = [1,2,3]
Output:
[
  [3],
  [1],
  [2],
  [1,2,3],
  [1,3],
  [2,3],
  [1,2],
  []
]
=end

def subsets(arr)
  return [[]] if arr.empty?
  head, *tail = arr
  subs = subsets(tail)
  subs + subs.map { |sub| sub + [head] }
end

puts subsets([1,2,3]).inspect