class CellChecker
  attr_reader :valid_grid_coordinates

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
  end

  def remove_blank_grid_of_4
    @to_be_removed = []
    @valid_grid_coordinates.each do |coordiates|

      coords = coordiates.split(",")
      @x = coords[0]
      @y = coords[1]
      @x_loop = @x.to_i
      @y_loop = @y.to_i

      @remove_this_coordinate = false
      @x_counter = 0

      4.times do
        @y_counter = 0
        4.times do
          @field[(@x_loop + @x_counter)] ||= []
          @remove_this_coordinate = true if
            @field[@x_loop + @x_counter][@y_loop + @y_counter] != '.'

          @y_counter += 1
        end
        @x_counter += 1
      end

    @to_be_removed << coordiates if @remove_this_coordinate == true
    end

    @to_be_removed.each do |remove|
      @valid_grid_coordinates.delete(remove)
    end
  end
end
