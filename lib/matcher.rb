class Matcher

  OPPOSITION_CELL = '1'
  PLAYER_CELL = '0'

  def initialize(board)
    @board = board
    @y = find_top_left_y_coordinate
    @x = find_top_left_x_coordinate
    @pattern = KillLibrary.new.next_gen_square(@x, @y)
  end

  def find
    @pattern.each do |variation|
      hits = []
      variation.each do |coordinates|
        hits << [coordinates[1], coordinates[0]] if @board[coordinates[1]][coordinates[0]] == OPPOSITION_CELL
      end
      return hits if hits.length == variation.length && hits.length == total_alive_cells
    end
    'No matches'
  end

  private

  def find_top_left_y_coordinate
    @board.each do |row|
      return @board.index(row).to_i if row.include? OPPOSITION_CELL
    end
  end

  def find_top_left_x_coordinate
    @board[@y].each do |column|
      return @board[@y].index(column).to_i if column.include? OPPOSITION_CELL
    end
  end

  def total_alive_cells
    counter = 0
      @board.each_with_index do |row, y|
        row.each_with_index do |cell, x|
          counter += 1 if cell == OPPOSITION_CELL || cell == PLAYER_CELL
        end
      end
    counter
  end
end
