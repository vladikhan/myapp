class SimpleTree
  attr_reader :root, :nodes

  def initialize(root, descendants)
    @root = root
    @descendeants = descendants

    @nodes = {}
    ([ @root ] + @descendeants).each do |d|
      d.child_nodes =[]
      @nodes[d.id] = d
    end
    @descendeants.each do |d|
      @nodes[d.parent_id].child_nodes << @nodes[d.id]
    end
  end
end