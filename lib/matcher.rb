class Matcher

  def initialize(board)
    @board = board
    @y = find_top_left_y_coordinate
    @x = find_top_left_x_coordinate
    @pattern = Pattern.new(@y, @x).build
  end

  def find(board)
    @pattern.each do |variation|
      hits = []
      variation.each do |coordinates|
        hits << [coordinates[1], coordinates[0]] if board[coordinates[1]][coordinates[0]] == '1'
      end
      return hits if hits.length == variation.length && hits.length == total_alive_cells
    end
    'No matches'
  end

  private

  def find_top_left_y_coordinate
    @board.each do |row|
      return @board.index(row).to_i if row.include? '1'
    end
  end

  def find_top_left_x_coordinate
    @board[@y].each do |column|
      return @board[@y].index(column).to_i if column.include? '1'
    end
  end

  def total_alive_cells
    counter = 0
      @board.each_with_index do |row, y|
        row.each_with_index do |cell, x|
          counter += 1 if cell == '1' || cell == '0'
        end
      end
    counter
  end
end
