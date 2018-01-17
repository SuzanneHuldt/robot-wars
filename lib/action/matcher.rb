class Matcher

  OPPOSITION_CELL = '1'
  PLAYER_CELL = '0'

  def initialize(board)
    @board = board
    @fragment_coordinates = find_fragments
  end

  def find
    hits = []
    @fragment_coordinates.each do |fragment|
      x, y = assign_x_and_y(fragment)
      patterns = KillLibrary.new.all_patterns(x, y)
      patterns.each do |pattern|
        pattern.each_with_index do |variation, index|
          variation.each do |coordinates|
            hits << [coordinates[1], coordinates[0]] if @board[coordinates[1]][coordinates[0]] == OPPOSITION_CELL
          end
          return hits if hits.length == variation.length && hits.length == total_alive_cells(Fragment.new.get_inner(@board)[index])
        end
      end
    end
    []
  end

  private

  # def check_pattern_presence(patterns, hits)
  #   patterns.each do |pattern|
  #     pattern.each_with_index do |variation, index|
  #       variation.each do |coordinates|
  #         hits << [coordinates[1], coordinates[0]] if @board[coordinates[1]][coordinates[0]] == OPPOSITION_CELL
  #       end
  #       return hits if hits.length == variation.length && hits.length == total_alive_cells(Fragment.new.get_inner(@board)[index])
  #     end
  #   end
  # end




























  def assign_x_and_y(fragment)
    y = fragment[1] + 1
    x = fragment[0] + 1
    while x <= @board[y].length
      break if @board[y][x] == OPPOSITION_CELL
      x += 1
    end
    return x, y
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
    finder.find(@board)
  end
end
