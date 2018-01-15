class Fragment
  def find(board)
    all_board_coordinates = find_all_coordinates(board)
    fragments = []
    all_board_coordinates.each do |coordinates|
      x = coordinates[0]
      y = coordinates[1]
      four_by_four_square = [[x, y], [x + 1, y], [x + 2, y], [x + 3, y], [x, y + 1], [x + 3, y + 1], [x, y + 2],[x + 3, y + 2], [x, y + 3], [x + 1, y + 3], [x + 2, y + 3], [x + 3, y + 3]]
      owned_cell = false
      four_by_four_square.each do |cell|
        board[cell[1]] ||= []
        owned_cell = true if board[cell[1]][cell[0]] != '.'
      end
      fragments << coordinates if owned_cell == false
    end
    fragments
  end

  private

  def find_all_coordinates(board)
    row = 0
    all_board_coordinates = []
    while row < board.length do
      column = 0
      while column < board[row].length do
        coordinates = []
        coordinates << row
        coordinates << column
        all_board_coordinates << coordinates
        column += 1
      end
      row += 1
    end
    all_board_coordinates
  end
end
