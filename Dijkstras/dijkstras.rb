class Dijkstras
  attr_accessor :graph, :start, :unvisited

  def self.run(graph, start)
    new(graph, start).run
  end

  def initialize(graph, start)
    @graph, @start = graph, start
    @unvisited = graph.nodes.dup
  end

  def run
    start_node = graph.nodes[start]
    start_node.distance = 0
    find_distances(start_node)
  end

  def find_distances(current_node)
    unvisited.delete(current_node)

    next_node = find_next_node(current_node)
    return unless next_node

    find_distances(next_node)
  end

  def find_next_node(current_node)
    best_choice_edge = nil

    current_node.edges.each do |edge|
      opposite_node = edge.opposite_node_on_edge(current_node)
      next unless unvisited.include?(opposite_node)
      best_choice_edge ||= edge

      current_path_distance = current_node.distance + edge.weight
      if opposite_node.distance.nil? || current_path_distance < opposite_node.distance
        opposite_node.distance = current_path_distance
      end

      if edge.weight < best_choice_edge.weight
        best_choice_edge = edge
      end
    end

    best_choice_edge.opposite_node_on_edge(current_node) if best_choice_edge
  end

end
