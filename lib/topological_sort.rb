require_relative 'graph'
require 'byebug'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  queue = Queue.new()

  vertices.each do |vertex|
    queue.enqueue(vertex) if vertex.in_edges.empty?
    # vertex.out_edges.each do |edge|
    #   edge.destroy!
    # end
  end

  until queue.empty?
    current = queue.dequeue
    # p current
    # p "----"
    sorted << current
    # p sorted
    # p "----"
    current.out_edges.each do |edge|
      # p edge.to_vertex
      # p "---"
      # p edge.to_vertex.in_edges
      edge_to_vertex = edge.to_vertex
      # p edge_to_vertex
      # p "---"
      edge.destroy!
      # p edge_to_vertex
      # p "-----"
      queue.enqueue(edge_to_vertex) if edge_to_vertex.in_edges.empty?
      # p edge_to_vertex.in_edges
      # vertices.delete(edge)
    end
  end
  # vertices.delete(current)
  # p queue.empty?
  sorted
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
    el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end

  def empty?
    @queue.length == 0
  end
end

# def topological_sort(vertices)
#
# end
