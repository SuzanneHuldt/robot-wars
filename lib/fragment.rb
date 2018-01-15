class Fragment
  def find(board)
    all_board_coordinates = find_all_coordinates(board)
    fragments = []
    all_board_coordinates.each do |coordinates|
      x = coordinates[0]
      y = coordinates[1]
      next if board[y][x] != '.'
      next if board[y][x + 1] != '.'
      next if board[y][x + 2] != '.'
      next if board[y][x + 3] != '.'
      next if board[y + 1][x] != '.'
      next if board[y + 1][x + 3] != '.'
      next if board[y + 2][x] != '.'
      next if board[y + 2][x + 3] != '.'
      next if board[y + 3][x] != '.'
      next if board[y + 3][x + 1] != '.'
      next if board[y + 3][x + 2] != '.'
      next if board[y + 3][x + 3] != '.'
      fragments << coordinates
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
