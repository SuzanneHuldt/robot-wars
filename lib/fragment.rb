class Fragment
  def find(board)
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
  end
end
