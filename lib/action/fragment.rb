class Fragment
  def initialize
    @inner_dimensions = []
  end

  def find(board)
    all_board_coordinates = find_all_coordinates(board)
    return_fragment_top_left_coordinates(board, all_board_coordinates)
  end

  def get_inner(board)
    fragments_coordinates = find(board)
    build_fragment_array(board, fragments_coordinates)
  end

  private

  def return_fragment_top_left_coordinates(board, coordinates)
    fragments = []
    coordinates.each do |coordinates|
      x, y = assign_board_x_and_y(coordinates)
      fragment_templates = FragmentLibrary.new.all_fragments(x, y)
      check_for_fragments(board, coordinates, fragment_templates, fragments, x, y)
    end
    fragments
  end

  def check_for_fragments(board, coordinates, templates, fragments, x, y)
    templates.each do |template|
      owned_cell = false
      owned_cell = set_owned_cell(board, template, owned_cell)
      if owned_cell == false
        fragments << coordinates
        @inner_dimensions << template[1]
      end
    end
  end

  def set_owned_cell(board, template, owned_cell)
    template[0].each do |cell|
      board[cell[1]] ||= []
      owned_cell = true if board[cell[1]][cell[0]] != '.'
    end
    owned_cell
  end

  def check_cell_ownership(board, template, owned_cell)
    template[0].each do |cell|
      board[cell[1]] ||= []
      owned_cell = true if board[cell[1]][cell[0]] != '.'
    end
    owned_cell
  end

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

  def assign_board_x_and_y(coordinates)
    x = coordinates[0]
    y = coordinates[1]
    return x, y
  end

  def build_fragment_array(board, coordinates)
    fragments = []
    coordinates.each_with_index do |fragment, index|
      x, y = assign_fragment_x_and_y(fragment)
      width, height = assign_width_and_height(index)
      fragments << create_fragment(board, x, y, width, height)
    end
    fragments
  end

  def assign_fragment_x_and_y(fragment)
    x = fragment[0] + 1
    y = fragment[1] + 1
    return x, y
  end

  def assign_width_and_height(index)
    width = @inner_dimensions[index][0]
    height = @inner_dimensions[index][1]
    return [width, height]
  end

  def create_fragment(board, x, y, width, height)
    fragment = []
    build_fragment(board, fragment, x, y, width, height)
    fragment
  end

  def build_row(board, height, row, x, y, w)
    height.times { |h| row << board[x + w][y + h] }
  end

  def build_fragment(board, fragment, x, y, width, height)
    width.times do |w|
      row = []
      build_row(board, height, row, x, y, w)
      fragment << row
    end
  end
end
