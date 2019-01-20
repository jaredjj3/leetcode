require "minitest/autorun"
require_relative "../../lib/1/is_number.rb"

# SESSION
# 1

def assert_end_node(key, str)
  if key.nil?
    assert_nil(end_node(str))
  else
    assert_equal(key, end_node(str).key)
  end
end


describe "#end_node" do
  it "returns the expected end node following the DFA" do
    assert_end_node(2, "0")
    assert_end_node(8, "2e10")
    assert_end_node(nil, ".e1")
  end
end

describe "#is_number" do
  it "returns true if string can be parsed into a number" do
    assert(is_number("0"))
    assert(is_number(" 0.1 "))
    assert(is_number("2e10"))
    assert(is_number(" -90e3   "))
    assert(is_number(" 6e-1"))
    assert(is_number("53.5e93"))
    assert(is_number("3."))
    assert(is_number(".1"))
    assert(is_number("46.e3"))
  end

  it "returns false if the string cannot be parsed into a number" do
    refute(is_number("abc"))
    refute(is_number("1 a"))
    refute(is_number(" 1e"))
    refute(is_number("e3"))
    refute(is_number(" 99e2.5 "))
    refute(is_number(" --6 "))
    refute(is_number("-+3"))
    refute(is_number("95a54e53"))
    refute(is_number("0e"))
    refute(is_number("."))
  end
end
