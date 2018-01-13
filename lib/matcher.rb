class Matcher

  def find(board)
    find_top_left_y_coordinate(board)
    find_top_left_x_coordinate(board[@y])

    pattern = Pattern.new(@y, @x).build

    pattern.each do |variation|
      hits = []
      variation.each do |coordinates|
        hits << [coordinates[1], coordinates[0]] if board[coordinates[1]][coordinates[0]] == '1'
      end
      return hits if hits.length == 3
    end
    'No matches'
  end

  private

  def find_top_left_y_coordinate(board)
    board.each do |row|
      if row.include? '1'
        @y = board.index(row).to_i
        break
      end
    end
  end

  def find_top_left_x_coordinate(row)
    row.each do |column|
      if column.include? '1'
        @x = row.index(column).to_i
      end
    end
  end

end
