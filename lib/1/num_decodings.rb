require_relative "../data_structures/data_structures.rb"

# SESSION
# 1

# PROMPT
=begin
A message containing letters from A-Z is being encoded to numbers using the following mapping:

'A' -> 1
'B' -> 2
...
'Z' -> 26
Given a non-empty string containing only digits, determine the total number of ways to decode it.

Example 1:

Input: "12"
Output: 2
Explanation: It could be decoded as "AB" (1 2) or "L" (12).
Example 2:

Input: "226"
Output: 3
Explanation: It could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).
=end

def num_decodings(str)
  return 0 if str.empty?
  return 0 if str == "0"

  a = 1
  b = str[str.size - 1] == "0" ? 0 : 1

  ndx = str.size - 2
  while ndx >= 0
    next ndx -= 1 if str[ndx] == "0"
    tmp = b
    b = a
    a = str[ndx..(ndx + 1)].to_i <= 26 ? tmp + b : tmp
    ndx -= 1
  end
  
  a
end
