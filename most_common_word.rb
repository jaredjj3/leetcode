require "minitest/autorun"

# Given a paragraph and a list of banned words, return the most frequent word that is not in the list of banned words.
# It is guaranteed there is at least one word that isn't banned, and that the answer is unique.

# Words in the list of banned words are given in lowercase, and free of punctuation.
# Words in the paragraph are not case sensitive.  The answer is in lowercase.

# Example:
# Input: 
# paragraph = "Bob hit a ball, the hit BALL flew far after it was hit."
# banned = ["hit"]
# Output: "ball"
# Explanation: 
# "hit" occurs 3 times, but it is a banned word.
# "ball" occurs twice (and no other word does), so it is the most frequent non-banned word in the paragraph. 
# Note that words in the paragraph are not case sensitive,
# that punctuation is ignored (even if adjacent to words, such as "ball,"), 
# and that "hit" isn't the answer even though it occurs more because it is banned.

# Note:

# 1 <= paragraph.length <= 1000.
# 1 <= banned.length <= 100.
# 1 <= banned[i].length <= 10.
# The answer is unique, and written in lowercase (even if its occurrences in paragraph may have uppercase symbols, and even if it is a proper noun.)
# paragraph only consists of letters, spaces, or the punctuation symbols !?',;.
# Different words in paragraph are always separated by a space.
# There are no hyphens or hyphenated words.
# Words only consist of letters, never apostrophes or other punctuation symbols.

require "set"

# @param {String} paragraph
# @param {String[]} banned
# @return {String}
def most_common_word(paragraph, banned)
  word_frequencies = normalize(paragraph).split(" ").reduce(Hash.new { |h, k| h[k] = 0 }) do |memo, word|
    memo[word] += 1
    memo
  end

  banned_set = banned.to_set

  most_frequent_word_and_frequency = word_frequencies.max_by do |(word, frequency)|
    next -Float::INFINITY if banned_set.include?(word)
    frequency
  end

  most_frequent_word_and_frequency.first
end

def normalize(str)
  str.gsub(/[^a-zA-Z\s]/, " ").squeeze(" ").lstrip.rstrip.downcase
end

describe "#normalize" do
  it "removes non letter characters" do
    assert_equal("foo bar baz", normalize("foo;. !bar! baz."))
  end

  it "handles obscure punctuation correctly" do
    assert_equal("a a a a b b b c c", normalize("a, a, a, a, b,b,b,c, c"))
  end
end

describe "#most_common_word" do
  it "returns the most frequent word that isn't banned" do
    paragraph = "Bob hit a ball, the hit BALL flew far after it was hit."
    banned = ["hit"]

    assert_equal("ball", most_common_word(paragraph, banned))
  end
end
