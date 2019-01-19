require_relative "../data_structures/data_structures.rb"

# SESSION
# 1

# PROMPT
=begin
Given a non-empty string s, you may delete at most one character. Judge whether you can make it a palindrome.

Example 1:
Input: "aba"
Output: True
Example 2:
Input: "abca"
Output: True
Explanation: You could delete the character 'c'.
Note:
The string will only contain lowercase characters a-z. The maximum length of the string is 50000.
=end

def valid_palindrome(str)
  l_ndx = 0
  r_ndx = str.size - 1
  while l_ndx < r_ndx
    unless str[l_ndx] == str[r_ndx]
      return palindromic?(str, l_ndx, r_ndx - 1) || palindromic?(str, l_ndx + 1, r_ndx)
    end

    l_ndx += 1
    r_ndx -= 1
  end

  true
end

def palindromic?(str, l_ndx, r_ndx)
  while l_ndx < r_ndx
    return false unless str[l_ndx] == str[r_ndx]
    l_ndx += 1
    r_ndx -= 1
  end

  true
end