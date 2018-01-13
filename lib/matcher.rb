class Matcher

  def find(board)
    board.each do |row|
      if row.include? '1'
        @y = board.index(row).to_i
        break
      end
    end
    board[@y].each do |column|
      if column.include? '1'
        @x = board[@y].index(column).to_i
      end
    end
  end

end
