class RandomMove
  def initialize
    @generator = Generator.new
    @birth = BirthPattern.new
  end

  def new_move(my_id, op_id, field, move_time, timebank)
    @cell_checker = CellChecker.new(field)
    @matcher = Matcher.new(field)
    @field = field
    @my_id = my_id    
    @op_id = op_id
    @my_cells, @op_cells, @empty_cells = get_cells(@my_id, @op_id)
    @moves = @my_cells.length >= 2 ? %w(birth kill) : %w(kill)
    @birth_patterns = @birth.birth(field, @cell_checker.get_valid_coordinates)
    @kill_patterns = @matcher.find
    @empty_cells = @empty_cells - @birth_patterns
    @kill_cells = (@op_cells + @my_cells - @kill_patterns).shuffle
    generate_move(move_time, timebank)
  end

  def generate_move(move_time, timebank)
    random_moves = []
    best_move = ['pass', -200]
    random_moves << ['pass']
    moves_number = timebank / 4
    moves_number = 100 if moves_number > 100
    moves_number.times { random_moves << send(@moves.sample) }
    random_moves.uniq!
    random_moves.each do |move|
      next_gen = @generator.next_generation(@generator.next_generation(apply_move(move)))
      score = next_gen.flatten.count(@my_id) - next_gen.flatten.count(@op_id)
      score = 1000 if next_gen.flatten.count(@op_id) <= 2
      best_move = [move, score] if score > best_move[1]
    end
    best_move[0]
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
    while @kill_patterns != []
      return ['kill', @kill_patterns.shift]
    end
    kill_cell = @kill_cells[0]
    @kill_cells.rotate!(1)
    ['kill', kill_cell]
  end

  def birth
    @empty_cells.shuffle!
    @my_cells.shuffle!
    while @birth_patterns != []
      return ['birth', @birth_patterns.shift, @my_cells[0], @my_cells[-1]]
    end
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
end

