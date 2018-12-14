require "minitest/autorun"
require "byebug"

# PROMPT
=begin
You have two arrays, a1, and a2 of the same length.

a1 has "keys",
a2 has "values"

If you were two group a2 elements by the corresponding key (of the same index) in a1,
then, each group should have unique values (return true). Otherwise, return false.

KW implementation:

boms/bulk_updater.rb

def check_dup_inputs
  inputs_by_output = Hash.new { |h, k| h[k] = Set.new }

  csv.each do |row|
    output_sku = row.field("output_sku")
    input_sku = row.field("input_sku")

    unless inputs_by_output[output_sku].add?(input_sku)
      errors << "#{output_sku} has duplicates of #{input_sku}"
    end
  end
end
=end

def check_dup_inputs(a1, a2)
  
end

describe "#check_dup_inputs" do
  it "returns true if all the grouped a2 values are unique" do
    assert_equal(true, check_dup_inputs([1, 1, 1], [1, 2, 3]))
    assert_equal(true, check_dup_inputs([1, 1, 2], [1, 2, 1]))
    assert_equal(true, check_dup_inputs([1, 2, 1], [1, 1, 2]))
    assert_equal(true, check_dup_inputs([1, 2, 3], [1, 1, 1]))
  end

  it "returns false if any of the grouped a2 values are not unique" do
    assert_equal(false, check_dup_inputs([1, 1, 1], [1, 1, 2]))
    assert_equal(false, check_dup_inputs([1, 1, 2], [1, 1, 2]))
    assert_equal(false, check_dup_inputs([1, 2, 1], [1, 1, 1]))
  end
end
