class Kruskal
  attr_accessor :graph, :tree

  def initialize(graph)
    @graph = graph
    @tree = []
  end

  def run
    sorted_edges = @graph.edges.sort_by(&:weight)
    sorted_edges.each do |edge|
      unless union_finder.connected?(*edge.nodes)
        union_finder.union!(*edge.nodes)
        @tree << edge
      end
    end
  end

  def sorted_tree_edges_to_array
    @tree.collect do |edge|
      edge.nodes.collect(&:id).sort!
    end.sort_by(&:first)
  end

  def union_finder
    @union_finder ||= UnionFinder.new(graph.nodes)
  end

end
