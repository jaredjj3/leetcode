require "minitest/autorun"
require_relative "../../lib/1/palindrome.rb"

# SESSION
# 1

describe "#palindrome" do
  it "returns true for strings that are palindromes" do
    assert(palindrome("tacocat"))
    assert(palindrome("racecar"))
  end

  it "ignores punctuation" do
    assert(palindrome("t#a co! cat!"))
    assert(palindrome("race,car?"))
  end

  it "ignores captilization" do
    assert(palindrome("TaCocat"))
    assert(palindrome("RACEcar"))
  end

  it "returns false for strings that are not palindromes" do
    refute(palindrome("asdf"))
    refute(palindrome("hello world"))
  end
end
