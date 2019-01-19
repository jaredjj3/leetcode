require "minitest/autorun"
require_relative "../../lib/data_structures/graph.rb"

# SESSION
# data_structures

describe "Graph" do
  describe "::initialize" do
    it "inits #matrix and #list" do
      graph = Graph.new
      assert_equal([], graph.matrix)
      assert_equal({}, graph.list)
    end
  end

  describe "::add" do

  end
end
