require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Create a method that behaves the same way as Ruby'as Array#combination.
=end

def combinations(arr, size)
end

describe "#combinations" do
  def assert_combinations(arr, size)
    assert_equal(
      arr.combination(arr, size).map(&:to_set).to_set,
      combinations(arr, size).map(&:to_set).to_set
    )
  end

  it "produces the same set of sets as Array#combination" do
    100.times do
      arr = Array.new(rand(0..10)).fill { rand(0..100) }
      size = rand(0..arr.size)
      assert_combinations(arr, size)
    end
  end
end
