class Fragment

  def find(board)
    all_board_coordinates = find_all_coordinates(board)
    fragments = []
    @inner_dimensions = []
    all_board_coordinates.each do |coordinates|
      x, y = assign_board_x_and_y(coordinates)
      fragment_templates = FragmentLibrary.new.all_fragments(x, y)
      owned_cell = false
      fragment_templates.each do |template|
        template[0].each do |cell|
          board[cell[1]] ||= []
          owned_cell = true if board[cell[1]][cell[0]] != '.'
        end
        fragments << coordinates if owned_cell == false
        @inner_dimensions << template[1] if owned_cell == false
      end
    end
    fragments
  end

  def get_inner(board)
    fragments_coordinates = find(board)
    build_fragment_array(board, fragments_coordinates)
  end

  private

  def find_all_coordinates(fragment)
    all_board_coordinates = []
    fragment.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        all_board_coordinates << create_coordinates(x, y)
      end
    end
    all_board_coordinates
  end

  def create_coordinates(x, y)
    coordinates = []
    coordinates << x
    coordinates << y
  end

  def build_fragment(board, x, y, width, height)
    fragment = []
    width.times do |w|
      row = []
      height.times do |h|
        row << board[x + w][y + h]
      end
      fragment << row
    end
    fragment
  end

  def build_fragment_array(board, coordinates)
    fragments = []
    coordinates.each_with_index do |fragment, index|
      x, y = assign_fragment_x_and_y(fragment)
      width, height = assign_width_and_height(index)
      fragments << build_fragment(board, x, y, width, height)
    end
    fragments
  end

  def assign_board_x_and_y(coordinates)
    x = coordinates[0]
    y = coordinates[1]
    return x, y
  end

  def assign_fragment_x_and_y(fragment)
    x = fragment[0] + 1
    y = fragment[1] + 1
    return x, y
  end

  def assign_width_and_height(index)
    width = @inner_dimensions[index][0]
    height = @inner_dimensions[index][1]
    return width, height
  end

end
