require "minitest/autorun"
require "byebug"

# PROMPT
=begin
This method returns true if all similar elements of an array are contiguous and false
if they are not.
=end

def contiguous?
end

describe "#contiguous?" do
  it "returns true for contiguous arrays" do
    assert(contiguous?([1, 1, 1, 2, 2, 2, 3, 4, 4]))
    assert(contiguous?([2, 2, 3, 3, 7, 7, 6, 6]))
    assert(contiguous?([1, 2, 3]))
  end

  it "returns false for non contiguous arrays" do
    refute(contiguous?([1, 1, 1, 2, 2, 2, 1, 3, 4, 4]))
    refute(contiguous?([2, 2, 3, 3, 7, 7, 2, 2, 6, 6]))
    refute(contiguous?([1, 2, 3, 1]))
  end

  it "returns true for empty arrays" do
    assert(contiguous?([]))
  end
end
