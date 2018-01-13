class Matcher

  def find(board)
    find_y_coordinate(board)
    find_x_coordinate(board[@y])

    p board[@y][@x]
    p board[@y][@x + 1]
    p board[@y + 1][@x]
    p board[@y + 1 ][@x + 1]
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
