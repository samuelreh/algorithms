require_relative '../graph'
require_relative '../edge'
require_relative '../node'
require_relative '../union_finder'
require_relative 'kruskal'

graph = Graph.new()

graph.add_edge(0, 1, 7)
graph.add_edge(0, 3, 5)
graph.add_edge(1, 3, 9)
graph.add_edge(1, 2, 8)
graph.add_edge(2, 4, 5)
graph.add_edge(1, 4, 7)
graph.add_edge(3, 4, 15)
graph.add_edge(3, 5, 6)
graph.add_edge(5, 4, 8)
graph.add_edge(5, 6, 11)
graph.add_edge(6, 4, 9)

kruskal = Kruskal.new(graph)
kruskal.run

unless kruskal.sorted_tree_edges_to_array == [
  [0,1],
  [0,3],
  [1,4],
  [2,4],
  [3,5],
  [4,6]
]
  raise 'Bad Algorithm'
end
