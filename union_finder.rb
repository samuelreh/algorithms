class UnionFinder
  def initialize(nodes)
    @hash = {}

    nodes.each do |node|
      @hash[node.id] = node.id
    end
  end

  def connected?(node_1, node_2)
    @hash[node_1.id] == @hash[node_2.id]
  end

  def union!(node_1, node_2)
    return if connected?(node_1, node_2)

    # save the node values because we will re assign them
    # in the loop that follows
    node_1_value = @hash[node_1.id]
    node_2_value = @hash[node_2.id]

    @hash.each_pair do |node_id, node|
      if @hash[node_id] == node_1_value
        @hash[node_id] = node_2_value
      end
    end
  end
end

