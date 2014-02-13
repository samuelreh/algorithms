require_relative '../graph'
require_relative '../edge'
require_relative '../node'
require_relative 'floyd_warshall'

graph = Graph.new()

# Add Edges
graph.add_edge(0, 2, -2)
graph.add_edge(2, 3, 2)
graph.add_edge(3, 1, -1)
graph.add_edge(1, 0, 4)
graph.add_edge(1, 2, 3)

floyd_warshall = FloydWarshall.new(graph)
floyd_warshall.run

expected_result = [
  [0, -1, -2, 0],
  [4, 0, 2, 4],
  [5, 1, 0, 2],
  [3, -1, 1, 0]
]

unless floyd_warshall.distance_matrix == expected_result
  raise 'Invalid Algorithm'
end
