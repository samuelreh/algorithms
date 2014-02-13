class FloydWarshall
  attr_accessor :graph, :distance_matrix

  def initialize(graph)
    @graph = graph
    @distance_matrix = []
  end

  def run
    initialize_matrix_to_infinity
    initialize_zero_distances
    find_initial_weights
    iterate
  end

  private


  def iterate
    nodes.each_index do |k|
      loop_through_matrix do |i, j|
        if distance_matrix[i][k] + distance_matrix[k][j] < distance_matrix[i][j]
          distance_matrix[i][j] = distance_matrix[i][k] + distance_matrix[k][j]
        end
      end
    end
  end

  def initialize_matrix_to_infinity
    loop_through_matrix do |i, j|
      distance_matrix[i] ||= []
      distance_matrix[i][j] = Float::INFINITY
    end
  end

  def loop_through_matrix
    nodes.each_index do |i|
      nodes.each_index do |j|
        yield(i,j)
      end
    end
  end

  def initialize_zero_distances
    nodes.each do |node|
      distance_matrix[node.id][node.id] = 0
    end
  end


  def find_initial_weights
    graph.edges.collect do |edge|
      distance_matrix[edge.first_node.id] ||= []
      distance_matrix[edge.first_node.id][edge.second_node.id] = edge.weight
    end
  end

  def nodes
    @graph.nodes
  end
end
