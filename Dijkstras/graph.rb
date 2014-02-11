class Graph
  attr_accessor :nodes, :edges

  def initialize
    @nodes = []
    @edges = []
  end

  def add_node(node)
    nodes << node
  end

  def add_edge(first_node_id, second_node_id, weight)
    first_node  = find_or_create_node first_node_id
    second_node = find_or_create_node second_node_id

    self.edges << Edge.new(first_node, second_node, weight)
  end

  def find_or_create_node(id)
    nodes[id] ||= Node.new(id)
  end

end
