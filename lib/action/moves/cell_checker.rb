class CellChecker
  attr_reader :grid_coordinates, :to_be_removed

  def initialize(field)
    @field = field
    @grid_coordinates = []
    @to_be_removed = []
  end

  def trim_edges
    15.times do |x|
      13.times do |y|
        @grid_coordinates << "#{x},#{y}"
      end
    end
  end

  def identify_blank_grid_of_4
    @grid_coordinates.each do |coordinates|
      coords = coordinates.split(",")
      x_loop = coords[0].to_i
      y_loop = coords[1].to_i
      remove_this_coordinate = false
      x_counter = 0
      4.times do
        y_counter = 0
        4.times do
          @field[(x_loop + x_counter)] ||= []
          remove_this_coordinate = true if
            @field[x_loop + x_counter][y_loop + y_counter] != '.'
          y_counter += 1
        end
        x_counter += 1
      end
    @to_be_removed << coordinates if remove_this_coordinate == false
    end
  end

  def remove_blank_grid_of_4
    @to_be_removed.each do |remove|
      @grid_coordinates.delete(remove)
    end
  end

  def get_valid_coordinates
    trim_edges
    identify_blank_grid_of_4
    remove_blank_grid_of_4
    valid_coords = []
    @grid_coordinates.each do |coordinates|
      coords = coordinates.split(",")
      valid_coords << [coords[0].to_i,coords[1].to_i]
    end
    valid_coords
  end
end
