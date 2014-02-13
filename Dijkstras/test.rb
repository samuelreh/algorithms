require_relative '../graph'
require_relative '../edge'
require_relative '../node'
require_relative 'dijkstras'

graph = Graph.new()

# Add Edges
graph.add_edge(0, 1, 7)
graph.add_edge(0, 2, 9)
graph.add_edge(1, 2, 10)
graph.add_edge(2, 3, 11)
graph.add_edge(1, 3, 15)
graph.add_edge(2, 5, 2)
graph.add_edge(3, 4, 6)
graph.add_edge(4, 5, 9)
graph.add_edge(0, 5, 14)

dijkstras = Dijkstras.new(graph, 0)
dijkstras.run

distances = graph.nodes.collect(&:distance)

unless distances == [0, 7, 9, 20, 20, 11]
  raise 'Invalid Algorithm'
end
