require_relative 'min_heap'
require_relative 'my_graph'
require_relative 'my_edge'
class Kruskal
  attr_accessor :heap, :groups, :graph, :mst
  def initialize graph
    @graph = graph
    @heap = heapify graph
    @groups = Array.new
    @mst = Array.new
  end
  def heapify graph
    edges = graph.getEdges
    i = 0
    heap = MinHeap.new
    while i <edges.length
      edge = edges[i]
      w = edge.getWeight
      heap.addNode w, edge
      i = i + 1
    end
    return heap
  end
  def getMST
    size = @graph.getVNum
    i = 0
    while i < size
      @groups.push(Array.new 1, i)
      i = i + 1
    end
    err = 0
    while @groups.length>1 && @heap.getSize > 1
      #puts err
      err = err + 1
      node = heap.removeRoot
      edge = node.getEdge
      verts = edge.getVerts
      v1 = verts[0]
      v2 = verts[1]
      g1 = 0
      g2 = 0
      search = true
      while search
        group = groups[g1]
        i = 0
        while i<group.length
          if group[i] == v1
            search = false
            g1 = g1 - 1
          end
          i = i + 1
        end
        g1 = g1 + 1
      end
      search = true
      while search
        group = groups[g2]
        i = 0
        while i<group.length
          if group[i] == v2
            search = false
            g2 = g2 - 1
          end
          i = i + 1
        end
        g2 = g2 + 1
      end
      if g1 < g2
        @mst.push(edge.getLabel)
        group1 = @groups[g1]
        group2 = @groups[g2]
        while group2.length >0
          group1.push(group2.pop)
        end
        @groups[g1] = group1
        @groups.delete_at g2
      end
      if g2 < g1
        @mst.push(edge.getLabel)
        group1 = @groups[g1]
        group2 = @groups[g2]
        while group1.length >0
          group2.push(group1.pop)
        end
        @groups[g2] = group2
        @groups.delete_at g1
      end
    end
    return @mst
  end
end