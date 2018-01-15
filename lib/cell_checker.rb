class CellChecker
  attr_reader :valid_grid_coordinates, :field

  def initialize(field)
    @field = field
    @valid_grid_coordinates = []
  end

  def check_for_valid_grid_of_4
    15.times do |x|
      13.times do |y|
        @valid_grid_coordinates << "#{x},#{y}"
      end
    end

    @valid_grid_coordinates.each do |coordiates|
      coords = coordiates.split(",")
      # p @field[coords[0].to_i][coords[1].to_i]
    end
  end
end

#&& (@field[y_loop][x_loop + 3] != nil)
