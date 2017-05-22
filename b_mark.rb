require_relative "kruskal"
require 'benchmark'
require_relative "min_heap"
require_relative "my_edge"
require_relative "my_graph"
require_relative "node"
class BMark
  graph = MyGraph.new

  file = File.open('output v1000-10000, e10000-100000.csv', 'w')
  (1..10).each do |size|
    graph.clear
    (size*1000).times do
      graph.addVert
    end
    (size*10000).times do
      graph.connect rand(size*100), rand(size*100), rand(500)
    end
    kruskal = Kruskal.new graph
    time = Benchmark.measure do |i|
      10.times do
        kruskal.getMST
      end
    end
    file.write("#{size*1000},#{size*10000},#{time.real/10}\n")
  end

  file.close
end