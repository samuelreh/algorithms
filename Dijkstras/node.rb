class Node
  attr_accessor :id, :edges, :distance

  def initialize(id)
    @id = id
    @edges = []
  end

  def to_s
    @id
  end

  def edges
    @edges
  end
end
