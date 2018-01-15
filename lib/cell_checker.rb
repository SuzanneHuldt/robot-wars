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
end
