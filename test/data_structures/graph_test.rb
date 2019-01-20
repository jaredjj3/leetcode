require "minitest/autorun"
require_relative "../../lib/data_structures/graph.rb"

# SESSION
# data_structures

describe "Graph" do
  describe "::initialize" do
    it "inits #nodes" do
      graph = Graph.new
      
      assert_equal({}, graph.nodes)
    end
  end

  describe "#[]" do
    it "returns nil if the key is not present in the graph" do
      graph = Graph.new

      assert_nil(graph[1])
    end

    it "returns the value of a node with the given key" do
      graph = Graph.new
      value = Object.new
      graph[1] = value

      node = graph[1]
      assert_equal(1, node.key)
      assert_equal(value, node.value)
    end
  end

  describe "#include?" do
    it "returns a boolean corresponding to the presence of a key in the graph" do
      graph = Graph.new
      graph[1] = 1

      assert(graph.include?(1))
      refute(graph.include?(2))
    end
  end

  describe "#[]=" do
    it "returns the value that was added" do
      graph = Graph.new
      value = Object.new

      assert_equal(value, graph[1] = value)
    end

    it "adds a node to #nodes" do
      graph = Graph.new
      value = Object.new
      graph[1] = value
      nodes = graph.nodes

      assert_equal(1, nodes.size)
      assert_equal(value, nodes[1].value)
    end

    it "replaces the value of an existing key" do
      graph = Graph.new
      value1 = Object.new
      value2 = Object.new

      refute_equal(value1, value2)
      graph[1] = value1
      assert_equal(value1, graph[1].value)
      graph[1] = value2
      assert_equal(value2, graph[1].value)
    end
  end

  describe "#delete" do
    it "returns the value that was deleted" do
      graph = Graph.new
      value = Object.new
      graph[1] = value

      assert_equal(value, graph.delete(1))
      assert_nil(graph.delete(1))
    end

    it "deletes the node from #nodes" do
      graph = Graph.new
      value = Object.new
      graph[1] = value

      assert_equal(1, graph.nodes.size)
      graph.delete(1)
      assert_equal(0, graph.nodes.size)
    end
  end
end
