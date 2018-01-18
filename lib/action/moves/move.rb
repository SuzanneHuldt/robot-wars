class Move
  def initialize
    @generator = Generator.new
    @birth = BirthPattern.new
  end

  def new_move(my_id, op_id, field, move_time, timebank)
    load_info(my_id, op_id, field, move_time, timebank)
    generate_move(move_time, timebank)
  end

  private

  def generate_move(move_time, timebank)
    number_of_moves = (timebank / 4) > 100 ? 100 : timebank / 4
    best_move(get_moves(number_of_moves))
  end

  def get_moves(number_of_moves)
    moves = [['pass']]
    number_of_moves.times { moves << send(@moves.sample) }
    moves
  end

  def best_move(moves)
    best_move = ['pass', -200]
    moves.each do |move|
      resulting_board = next_gen(move)
      score = get_score(resulting_board)
      best_move = [move, score] if score > best_move[1]
    end
    best_move[0]
  end

  def next_gen(move)
    @generator.next_generation(@generator.next_generation(apply_move(move)))
  end

  def get_score(board)
    return -1000 if board.flatten.count(@op_id) < 3
    return 1000 if board.flatten.count(@op_id) == 0
    board.flatten.count(@my_id) - board.flatten.count(@op_id)
  end

  def apply_move(move)
    field = @field.map(&:clone)
    case move[0]
    when 'pass'
      return field
    when 'kill'
      field[move[1][0]][move[1][1]] = '.'
      return field
    when 'birth'
      field[move[1][0]][move[1][1]] = @my_id
      field[move[2][0]][move[2][1]] = '.'
      field[move[3][0]][move[3][1]] = '.'
    end
    field
  end

  def kill
    return ['kill', @kill_patterns.shift] if @kill_patterns != []
    kill_cell = @kill_cells[0]
    @kill_cells.rotate!(1)
    ['kill', kill_cell]
  end

  def birth
    @my_cells.shuffle!
    return 'birth', @birth_patterns.shift, @my_cells[0], @my_cells[-1] if @birth_patterns != []
    @empty_cells.shuffle!
    ['birth', @empty_cells.shift, @my_cells[0], @my_cells[-1]]
  end

  def get_cells(my_id, op_id)
    [filter_cells(my_id), filter_cells(op_id), filter_cells('.')]
  end

  def filter_cells(id)
    cells = []
    @field.each_with_index do |row, x|
      row.each_with_index do |cell, y|
        cells << [x, y] if cell == id
      end
    end
    cells
  end

  def load_info(my_id, op_id, field, move_time, timebank)
    @cell_checker = CellChecker.new
    @matcher = Matcher.new(field)
    @field = field
    @my_id = my_id
    @op_id = op_id
    @my_cells, @op_cells, @empty_cells = get_cells(@my_id, @op_id)
    @moves = @my_cells.length >= 2 ? %w(birth kill) : %w(kill)
    @birth_patterns = @birth.birth(field, @cell_checker.get_valid_coordinates(field))
    @kill_patterns = @matcher.find
    @empty_cells = @empty_cells - @birth_patterns
    @kill_cells = (@op_cells + @my_cells - @kill_patterns).shuffle
  end
end
