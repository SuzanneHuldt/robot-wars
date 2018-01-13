class Matcher

  def find(board)
    find_y_coordinate(board)
    find_x_coordinate(board[@y])

    pattern = [
      [[@x, @y], [@x + 1, @y], [@x, @y + 1]],
      [[@x, @y], [@x + 1, @y], [@x + 1, @y + 1]],
      [[@x, @y], [@x - 1, @y + 1], [@x, @y + 1]],
      [[@x, @y], [@x, @y + 1], [@x + 1, @y + 1]]
    ]

    pattern.each do |variation|
      hits = []
      variation.each do |coordinates|
        hits << true if board[coordinates[1]][coordinates[0]] == '1'
      end
      return true if hits.length == 3
    end

  end

  private

  def find_y_coordinate(board)
    board.each do |row|
      if row.include? '1'
        @y = board.index(row).to_i
        break
      end
    end
  end

  def find_x_coordinate(row)
    row.each do |column|
      if column.include? '1'
        @x = row.index(column).to_i
      end
    end
  end

end
