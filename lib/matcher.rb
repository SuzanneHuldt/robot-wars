class Matcher

  def initialize(board)
    @board = board
    @y = find_top_left_y_coordinate(@board)
    @x = find_top_left_x_coordinate(@board[@y])
    @pattern = Pattern.new(@y, @x).build
  end

  def find(board)
    @pattern.each do |variation|
      hits = []
      variation.each do |coordinates|
        hits << [coordinates[1], coordinates[0]] if board[coordinates[1]][coordinates[0]] == '1'
      end
      return hits if hits.length == variation.length
    end
    'No matches'
  end

  private

  def find_top_left_y_coordinate(board)
    board.each do |row|
      return board.index(row).to_i if row.include? '1'
    end
  end

  def find_top_left_x_coordinate(row)
    row.each do |column|
      return row.index(column).to_i if column.include? '1'
    end
  end
end
