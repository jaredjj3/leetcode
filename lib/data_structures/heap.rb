# SESSION
# data_structures

# PROMPT
=begin
Implement a heap data structure.

http://interactivepython.org/courselib/static/pythonds/Trees/BinaryHeapImplementation.html
=end

class Heap
  DEFAULT_COMPARATOR = Proc.new { |a, b| a <=> b }.freeze

  attr_reader :nodes, :size, :cmp

  def self.left_index(index)
    2 * index
  end

  def self.right_index(index)
    2 * index + 1
  end

  def self.parent_index(index)
    index / 2
  end

  def initialize(&cmp)
    @nodes = [nil]
    @cmp = cmp || DEFAULT_COMPARATOR
  end

  def insert(value)
    @nodes << value
    heapify_up!
  end

  def size
    @nodes.size - 1
  end

  def [](index)
    @nodes[index]
  end

  def peek
    @nodes[1]
  end

  def poll
    node = @nodes[1]
    @nodes[1] = @nodes.pop if size > 1
    heapify_down!
    node
  end

  def has_left?(index)
    Heap.left_index(index) < size
  end

  def has_right?(index)
    Heap.right_index(index) < size
  end

  def has_parent?(index)
    Heap.parent_index(index) > 0
  end

  def left(index)
    @nodes[Heap.left_index(index)]
  end

  def right(index)
    @nodes[Heap.right_index(index)]
  end

  def parent(index)
    @nodes[Heap.parent_index(index)]
  end

  private

    # Takes the last node and bubbles it up to where it will still
    # maintain the heap property. Should only be called from #insert
    def heapify_up!
      ndx = size - 1
      while has_parent?(ndx) && (@cmp.call(parent(ndx), self[ndx]) > 0)
        swap!(ndx, Heap.parent_index(ndx))
        ndx = Heap.parent_index(ndx)
      end
    end

    # Takes the first node and sinks it to where it will still maintain
    # the heap property. Should only be called from #poll
    def heapify_down!
      ndx = 1
      while has_left?(ndx)
        smaller_ndx = has_right?(ndx) && (@cmp.call(right(ndx), left(ndx)) < 0) ?
          Heap.right_index(ndx) : Heap.left_index(ndx)
        
        break if self[smaller_ndx] > self[ndx]
        
        swap!(ndx, smaller_ndx)
        ndx = smaller_ndx
      end
    end

    def swap!(src_ndx, dst_ndx)
      @nodes[src_ndx], @nodes[dst_ndx] = @nodes[dst_ndx], @nodes[src_ndx]
    end
end
