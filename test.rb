require_relative 'my_graph'
require_relative 'kruskal'
class Test
  graph = MyGraph.new
  i = 0
  while i <10
    graph.addVert
    i = i + 1
  end
  i = 0
  while i <10
    graph.connect i, ((i+1)%10), ((i*3)%7)
    graph.connect i, ((i+3)%10), ((2*i)+1)
    i = i + 1
  end
  kruskal = Kruskal.new graph
  mst = kruskal.getMST
  while(mst.length > 0)
    puts(mst.pop)
  end
end