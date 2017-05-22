require_relative "my_vertex"
require_relative "my_edge"
class MyGraph
  attr_accessor :vertices, :edges, :adjMat, :vlabel, :elabel
  def initialize
    @vertices = []
    @edges = []
    @adjMat = Array.new
    @vlabel = 0
    @elabel = 0
  end
  def addVert val = nil
    vert = MyVertex.new val, @vlabel
    @vertices.push vert
    @vlabel = @vlabel + 1
    if(@adjMat.length>0)
      i = 0
      while i<(@adjMat.length)
        v = @adjMat[i]
        v.push(0)
        @adjMat[i] = v
        i = i + 1
      end
      arr = Array.new(@vlabel,0)
      @adjMat.push arr
    else
      arr = Array.new 1, 0
      @adjMat.push arr
    end

  end
  def connect vert1, vert2, weight
    edge = MyEdge.new @elabel, vert1, vert2, weight
    arr = @adjMat[vert1]
    arr[vert2] = @elabel
    @adjMat[vert1] = arr
    arr = @adjMat[vert2]
    arr[vert1] = @elabel
    @adjMat[vert2] = arr
    @edges.push(edge)
    @elabel = @elabel + 1
  end
  def getDegree vertex
    i = vertex.getLabel
    arr = @adjMat[i]
    j = 0
    k = 0
    while(j<arr.length)
      if(arr[j]>0)
        k = k + 1
      end
      j = j + 1
    end
    return k
  end
  def getEdges
    return @edges
  end
  def getVNum
    return @vertices.length
  end
  def clear
    @vertices = Array.new
    @edges = Array.new
    @adjMat = Array.new
    @vlabel = 0
    @elabel = 0
  end
end