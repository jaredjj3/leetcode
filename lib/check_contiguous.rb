require "minitest/autorun"
require "byebug"
require "set"

# PROMPT
=begin
This method returns true if all similar elements of an array are contiguous and false
if they are not.
=end

def contiguous?(arr)
  probe = arr.first
  set = Set.new

  arr.all? do |el|
    next false if set.include?(el) && el != probe
    set.add(el)
    probe = el
  end
end

def check_contiguous
  probe = arr.first
  set = Set.new
  errors = []

  arr.each do |el|
    errors << "Error" if set.include?(el) && el != probe
    set.add(el)
    probe = el
  end
end

describe "#contiguous?" do
  it "returns true for contiguous arrays" do
    assert_equal(true, contiguous?([1, 1, 1, 2, 2, 2, 3, 4, 4]))
    assert_equal(true, contiguous?([2, 2, 3, 3, 7, 7, 6, 6]))
    assert_equal(true, contiguous?([1, 2, 3]))
  end

  it "returns false for non contiguous arrays" do
    assert_equal(false, contiguous?([1, 1, 1, 2, 2, 2, 1, 3, 4, 4]))
    assert_equal(false, contiguous?([2, 2, 3, 3, 7, 7, 2, 2, 6, 6]))
    assert_equal(false, contiguous?([1, 2, 3, 1]))
  end

  it "returns true for empty arrays" do
    assert_equal(true, contiguous?([]))
  end
end
