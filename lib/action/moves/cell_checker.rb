class CellChecker
  attr_reader :grid_coordinates, :to_be_removed

  def initialize
    @grid_coordinates = []
    @to_be_removed = []
  end

  def trim_edges(field)
    13.times do |y|
      15.times do |x|
        @grid_coordinates << "#{x},#{y}"
      end
    end
  end

  def identify_blank_grid_of_4(field)
    @grid_coordinates.each do |coordinates|
      grid_ref = coordinates.split(",")
      x = grid_ref[0].to_i
      y = grid_ref[1].to_i
      if blank_4x4?(field,x,y)
        @to_be_removed << "#{x},#{y}"
      end
      end
  end

  def blank_4x4?(field, x, y)
    z = 0
    4.times do
      z += 1 if blank_row(field, x, y)
      y += 1
    end
    z == 4
  end

  def blank_row(field, x, y)
    a = 0
    z = 0
    while z < 4
      a += 1 if field[y][x] != '.'
      x += 1
      z += 1
    end

    a == 0
  end

  def remove_blank_grid_of_4
    @to_be_removed.each do |remove|
      @grid_coordinates.delete(remove)
    end
     @grid_coordinates
  end

  def prepare_grid(field)
    trim_edges(field)
    identify_blank_grid_of_4(field)
    remove_blank_grid_of_4
  end

  def get_valid_coordinates(field)
    prepare_grid(field)
    valid_coords = []
    @grid_coordinates.each do |coordinates|
      coords = coordinates.split(",")
      valid_coords << [coords[0].to_i,coords[1].to_i]
    end
    valid_coords
  end
end

