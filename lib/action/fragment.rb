class Fragment

  def find(board)
    all_board_coordinates = find_all_coordinates(board)
    fragments = []
    @inner_dimensions = []
    all_board_coordinates.each do |coordinates|
      x = coordinates[0]
      y = coordinates[1]
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
    fragments = []
    fragments_coordinates.each_with_index do |fragment, index|
      x = fragment[0] + 1
      y = fragment[1] + 1
      width = @inner_dimensions[index][0]
      height = @inner_dimensions[index][1]
      width.times do |w|
        row = []
        height.times do |h|
          row << board[x + w][y + h]
        end
        fragments << row
      end
    end
    fragments
  end

  private

  def find_all_coordinates(fragment)
    all_board_coordinates = []
    fragment.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        coordinates = []
        coordinates << x
        coordinates << y
        all_board_coordinates << coordinates
      end
    end
    all_board_coordinates
  end

end
