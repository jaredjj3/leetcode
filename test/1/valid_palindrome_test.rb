require "minitest/autorun"
require_relative "../../lib/1/valid_palindrome.rb"

# SESSION
# 1

describe "#valid_palindrome" do
  it "returns true if the original string is a palindrome" do
    assert(valid_palindrome("aba"))
    assert(valid_palindrome("abba"))
  end

  it "returns true if a single character can be removed to make a palindrome" do
    assert(valid_palindrome("abca"))
    assert(valid_palindrome("abbca"))
  end

  it "returns false if it takes more than one character to make a palindrome" do
    refute(valid_palindrome("abcca"))
    refute(valid_palindrome("abcbca"))
  end
end
