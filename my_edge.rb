class MyEdge
  attr_accessor :label, :vert1, :vert2, :weight
  def initialize label = nil, vert1 = nil, vert2 = nil, weight = nil
    @label = label
    @vert1 = vert1
    @vert2 = vert2
    @weight = weight
  end
  def getLabel
    return @label
  end
  def getWeight
    return @weight
  end
  def getVerts
    verts = [@vert1,@vert2]
    return verts
  end
end