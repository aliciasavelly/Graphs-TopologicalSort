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
    sorted << current

    current.out_edges.each do |edge|
      edge_to_vertex = edge.to_vertex
      # edge.destroy!
      # queue.enqueue(edge_to_vertex) if edge_to_vertex.in_edges.empty?
      count = 0
      edge_to_vertex.in_edges.each do |edge|
        count += 1 unless sorted.include?(edge.from_vertex)
      end
      queue.enqueue(edge_to_vertex) if count == 0
    end
  end

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
