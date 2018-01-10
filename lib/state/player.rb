class Player

  attr_reader :name, :living_cells, :last_move

  def initialize(name, living_cells, last_move=nil)
    @name = name
    @living_cells = living_cells
    @last_move = last_move
  end

end
