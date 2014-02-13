class Edge
  attr_accessor :weight, :nodes, :first_node, :second_node

  def initialize(first_node, second_node, weight)
    first_node.edges << self
    second_node.edges << self

    self.first_node = first_node
    self.second_node = second_node
    self.nodes = [first_node, second_node]
    self.weight = weight
  end

  def opposite_node_on_edge(node)
    raise unless nodes.include?(node)
    (nodes - [node]).last
  end

end
