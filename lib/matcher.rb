class Matcher

  OPPOSITION_CELL = '1'
  PLAYER_CELL = '0'

  def initialize(board)
    @board = board
  end

  def find
    fragment_coordinates = find_fragments
    p fragment_coordinates
    hits  = []
    fragment_coordinates.each do |fragment|
      @y = fragment[1] + 1
      @x = fragment[0] + 1
      while @x <= @board[@y].length
        break if @board[@y][@x] == OPPOSITION_CELL
        @x += 1
      end
      @patterns = KillLibrary.new.next_gen_square(@x, @y)
      @patterns.each do |variation|
        variation.each do |coordinates|
            hits << [coordinates[1], coordinates[0]] if @board[coordinates[1]][coordinates[0]] == OPPOSITION_CELL
        end
        return hits if hits.length == variation.length && hits.length == total_alive_cells(Fragment.new.get_inner(@board))
      end
    end
    'No matches'
  end

  private

  def find_top_left_y_coordinate(board)
    board.each do |row|
      return board.index(row).to_i if row.include? OPPOSITION_CELL
    end
  end

  def find_top_left_x_coordinate(board)
    board[@y].each do |column|
      return row[@y].index(column).to_i if column.include? OPPOSITION_CELL
    end
  end

  def total_alive_cells(fragment)
    counter = 0
      fragment.each_with_index do |row, y|
        row.each_with_index do |cell, x|
          counter += 1 if cell == OPPOSITION_CELL || cell == PLAYER_CELL
        end
      end
    counter
  end

  def find_fragments
    finder = Fragment.new
    @fragments = finder.find(@board)
  end
end
