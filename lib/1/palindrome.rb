require_relative "../data_structures/data_structures.rb"

# SESSION
# 1

# PROMPT
=begin
Create a method that determines if a string is a palindrome or not.
=end

def palindrome(str)
  sanitized = str.scan(/[a-zA-Z]/).map!(&:downcase)
  sanitized == sanitized.reverse
end
