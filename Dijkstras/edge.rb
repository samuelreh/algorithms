class Edge
  attr_accessor :weight, :nodes

  def initialize(first_node, second_node, weight)
    first_node.edges << self
    second_node.edges << self

    self.nodes = [first_node, second_node]
    self.weight = weight
  end

  def opposite_node_on_edge(first_node)
    raise unless nodes.include?(first_node)
    (nodes - [first_node]).last
  end

end
