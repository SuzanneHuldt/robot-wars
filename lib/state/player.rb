class Player

  attr_reader :name, :living_cells, :last_move

  def initialize(name=nil, living_cells=nil, last_move=nil)
    @name = name
    @living_cells = living_cells
    @last_move = last_move
  end

  def update_living_cells(number_of_cells)
    @living_cells = number_of_cells
  end

  def update_last_move(last_move)
    @last_move = last_move
  end

  def update_name(name)
    @name = name
  end

end
