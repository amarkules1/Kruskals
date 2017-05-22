class MyVertex
  attr_accessor :value, :label
  def initialize value = nil, label = nil
    @value = value
    @label = label
  end
  def getLabel
    return @label
  end
  def getVal
    return @value
  end
end