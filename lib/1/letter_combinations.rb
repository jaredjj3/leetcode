require_relative "../data_structures/data_structures.rb"

# SESSION
# 1

# PROMPT
=begin
Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.

A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

Example:

Input: "23"
Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
Note:

Although the above answer is in lexicographical order, your answer could be in any order you want.
=end

MAP = {
  "2" => %W(a b c),
  "3" => %W(d e f),
  "4" => %W(g h i),
  "5" => %W(j k l),
  "6" => %W(m n o),
  "7" => %W(p q r s),
  "8" => %W(t u v),
  "9" => %W(w x y z)
}.freeze

def letter_combinations(digits)
  return [] if digits.empty?
  head, *tail = digits.chars
  suffixes = letter_combinations(tail.join)
  suffixes = suffixes.empty? ? [""] : suffixes
  MAP.fetch(head).flat_map { |prefix| suffixes.map { |suffix| prefix + suffix } }
end
