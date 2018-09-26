require "minitest/autorun"

# Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

# Symbol       Value
# I             1
# V             5
# X             10
# L             50
# C             100
# D             500
# M             1000
# For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as, XII, which is simply X + II. The number twenty seven is written as XXVII, which is XX + V + II.

# Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

# I can be placed before V (5) and X (10) to make 4 and 9. 
# X can be placed before L (50) and C (100) to make 40 and 90. 
# C can be placed before D (500) and M (1000) to make 400 and 900.
# Given a roman numeral, convert it to an integer. Input is guaranteed to be within the range from 1 to 3999.

# Example 1:

# Input: "III"
# Output: 3
# Example 2:

# Input: "IV"
# Output: 4
# Example 3:

# Input: "IX"
# Output: 9
# Example 4:

# Input: "LVIII"
# Output: 58
# Explanation: L = 50, V= 5, III = 3.
# Example 5:

# Input: "MCMXCIV"
# Output: 1994
# Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.

def roman_to_int(str)
end

describe "#roman_to_int" do
  it "can handle basic cases" do
    assert_equal(3, roman_to_int("III"))
  end

  it "can handle the special case for 4" do
    assert_equal(4, roman_to_int("IV"))
  end

  it "can handle the special case for 9" do
    assert_equal(9, roman_to_int("IX"))
  end

  it "can handle the special case for 40" do
    assert_equal(40, roman_to_int("XL"))
  end

  it "can handle the special case for 90" do
    assert_equal(90, roman_to_int("XC"))
  end

  it "can handle the special case for 400" do
    assert_equal(400, roman_to_int("CD"))
  end

  it "can handle the special case for 400" do
    assert_equal(400, roman_to_int("CD"))
  end

  it "can handle the special case for 900" do
    assert_equal(900, roman_to_int("CM"))
  end

  it "can handle the other prompt examples" do
    assert_equal(58, "LVIII")
    assert_equal(1994, "MCMXCIV")
  end
end
