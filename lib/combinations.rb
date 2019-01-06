require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Create a method that behaves the same way as Ruby'as Array#combination.
=end

def combinations(arr, size)
  return [[]] if size == 0
  
  arr.flat_map.with_index do |el, ndx|
    combinations(arr[(ndx + 1)..-1], size - 1).map { |combo| combo + [el] }
  end
end

describe "#combinations" do
  def assert_combinations(arr, size)
    assert_equal(
      arr.combination(size).map(&:to_set).to_set,
      combinations(arr, size).map(&:to_set).to_set,
      "failed case for arr = #{arr}, size = #{size}"
    )
  end

  it "produces the same set of sets as Array#combination" do
    100.times do
      arr = Array.new(rand(0..5)).fill { rand(0..100) }
      assert_combinations(arr, rand(0..arr.size))
    end
  end
end
