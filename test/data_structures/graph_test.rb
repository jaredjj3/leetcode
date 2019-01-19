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

  describe "#get" do
    it "returns nil if the key is not present in the graph" do
      graph = Graph.new

      assert_nil(graph.get(1))
    end

    it "returns the value of a node with the given key" do
      graph = Graph.new
      value = Object.new
      graph.add(1, value)

      node = graph.get(1)
      assert_equal(1, node.key)
      assert_equal(value, node.value)
    end
  end

  describe "#has?" do
    it "returns a boolean corresponding to the presence of a key in the graph" do
      graph = Graph.new
      graph.add(1, 1)

      assert(graph.has?(1))
      refute(graph.has?(2))
    end
  end

  describe "#add" do
    it "returns the value that was added" do
      graph = Graph.new
      value = Object.new

      assert_equal(value, graph.add(1, value))
    end

    it "adds a node to #nodes" do
      graph = Graph.new
      value = Object.new
      graph.add(1, value)
      nodes = graph.nodes

      assert_equal(1, nodes.size)
      assert_equal(value, nodes.first.value)
    end

    it "adds the node to #matrix" do
      graph = Graph.new
      graph.add(1, 1)
      matrix = graph.matrix

      assert_equal(1, matrix.size)
      assert_equal(1, matrix.first.size)
      refute(matrix.first.first)
    end

    it "adds the node to #list" do
      graph = Graph.new
      value = Object.new
      graph.add(1, value)
      list = graph.list

      assert_equal(1, list.size)
      assert_equal([], list.fetch(1))
      assert_equal([1], list.keys)
    end

    it "replaces the value of an existing key" do
      graph = Graph.new
      value1 = Object.new
      value2 = Object.new

      refute_equal(value1, value2)
      graph.add(1, value1)
      assert_equal(value1, graph.get(1).value)
      graph.add(1, value2)
      assert_equal(valie2, graph.get(1).value)
    end
  end

  describe "#remove" do
    it "returns the value that was removed" do
      assert_equal(value, graph.remove(1))
    end

    it "removes the node from #nodes" do
      graph = Graph.new
      value = Object.new
      graph.add(1, value)

      assert_equal(1, graph.nodes.size)
      graph.remove(1)
      assert_equal(0, graph.nodes.size)
    end

    it "removes the node from #list" do
      graph = Graph.new
      value = Object.new
      graph.add(1, value)

      assert_equal(1, graph.list.size)
      graph.remove(1)
      assert_equal(0, graph.nodes.size)
    end

    it "removes the node from #matrix" do
      graph = Graph.new
      value = Object.new
      graph.add(1, value)

      assert_equal(1, graph.matrix.size)
      assert_equal(1, graph.matrix.first.size)
      graph.remove(1)
      assert_equal(0, graph.matrix.size)
    end
  end

  describe "#connect" do
    it "returns a boolean correspond to if a new connection was made from key1 to key2" do
      graph = Graph.new
      graph.add(1, Object.new)
      graph.add(2, Object.new)

      assert(graph.connect(1, 2))
      refute(graph.connect(1, 2))
      
      assert(graph.connect(2, 1))
      refute(graph.connect(2, 1))

      assert(graph.connect(1, 1))
      refute(graph.connect(1, 1))
    end

    it "does not change #nodes" do
      graph = Graph.new
      graph.add(1, Object.new)
      graph.add(2, Object.new)

      before = [*graph.nodes]
      graph.connect(1, 2)
      after = [*graph.nodes]
      assert_equal(before, after)
    end

    it "updates #list to include the new edge" do
      graph = Graph.new
      value1 = Object.new
      value2 = Object.new
      graph.add(1, value1)
      graph.add(2, value2)
      
      assert_equal([], graph.list.fetch(1))
      assert_equal([], graph.list.fetch(2))
      graph.connect(1, 2)
      assert_equal([value2], graph.list.fetch(1).map(&:value))
      assert_equal([], graph.list.fetch(2))
    end

    it "updates #matrix to include the new edge" do
      graph = Graph.new
      graph = Graph.new
      graph.add(1, 1)
      graph.add(2, 2)

      assert_equal([[false, false], [false, false]], graph.matrix)
      graph.connect(1, 2)
      assert_equal([[false, true], [false, false]], graph.matrix)
    end
  end

  describe "#children" do
    it "returns the children for a given key" do
      graph = Graph.new
      graph = Graph.new
      value1 = Object.new
      value2 = Object.new
      graph.add(1, value1)
      graph.add(2, value2)

      assert_equal([], graph.children(1))
      assert_equal([], graph.children(2))
      graph.connect(1, 2)
      assert_equal([value2], graph.children(1).map(&:value))
      assert_equal([], graph.children(2))
    end
  end
end
