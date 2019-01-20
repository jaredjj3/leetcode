# SESSION
# data_structures

# PROMPT
=begin
pg. 105 CrackingTheCodingInterview 6th Ed

A graph is a collection of nodes with edges between (some of ) them.

- Graphs can be either directed or undirected.
- The graph might consist of multiple isolated subgraphs. If there is a path between
every pair of vertices, it is called a "connected graph".
- The graph can also have cycles (or not). An "acyclic graph" is one without cycles.

This class will have methods that allow the nodes to be represented as an
adjacency list or matrix.
=end

class Graph
  class Node
    attr_reader :key, :children
    attr_accessor :value

    def initialize(key, value)
      @key = key
      @value = value
      @children = Set.new
    end
  end

  attr_reader :nodes

  def initialize
    @nodes = {}
  end

  def [](key)
    @nodes[key]
  end

  def include?(key)
    @nodes.key?(key)
  end

  def []=(key, value)
    @nodes[key] ||= Node.new(key, value)
    @nodes[key].value = value
  end

  def delete(key)
    @nodes.delete(key)&.value
  end
end
