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
    attr_reader :key
    attr_accessor :value

    def initialize(key, value)
      @key = key
      @value = value
    end
  end

  attr_reader :matrix, :list

  def initialize
    @nodes = {}
    @index_by_key = {}
    @matrix = []
    @list = {}
  end

  def get(key)
    @nodes[key]
  end

  def nodes
    @nodes.values
  end

  def has?(key)
    @list.key?(key)
  end

  def add(key, value)
    if has?(key)
      get(key).value = value
    else
      node = Node.new(key, value)
      @index_by_key[key] = @nodes.size
      @nodes[key] = node
      @list[key] = []
      @matrix << []
      @matrix.each { |row| row.fill(false, row.size...@matrix.size) }
    end

    value
  end

  def remove(key)
    return nil unless has?(key)

    value = get(key).value
    ndx = index(key)
    @matrix.delete_at(ndx)
    @matrix.each { |row| row.delete_at(ndx) }
    @list.delete(key)
    @nodes.reject! { |node_key| node_key == key }

    value
  end

  def connect(key1, key2)
    return false if !has?(key1) || !has?(key2)
    return false if connected?(key1, key2)

    @list[key1] << get(key2)

    ndx1 = index(key1)
    ndx2 = index(key2)
    @matrix[ndx1][ndx2] = true

    true
  end

  def connected?(key1, key2)
    ndx1 = index(key1)
    ndx2 = index(key2)
    
    return false if ndx1.nil? || ndx2.nil?
    @matrix[ndx1][ndx2]
  end

  def children(key)
    @list[key]
  end

  private

    def index(key)
      @index_by_key[key]
    end
end
