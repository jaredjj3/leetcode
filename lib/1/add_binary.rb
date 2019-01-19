require_relative "../data_structures/data_structures.rb"

# SESSION
# 1

# PROMPT
=begin
Given two binary strings, return their sum (also a binary string).

The input strings are both non-empty and contains only characters 1 or 0.

Example 1:

Input: a = "11", b = "1"
Output: "100"
Example 2:

Input: a = "1010", b = "1011"
Output: "10101"
=end

def add_binary(bin1, bin2)
  a = bin1.to_i(2)
  b = bin2.to_i(2)

  sum = a ^ b
  carry = a & b

  until carry == 0
    shifted = carry << 1
    carry = sum & shifted
    sum = sum ^ shifted
  end

  sum.to_s(2)
end
