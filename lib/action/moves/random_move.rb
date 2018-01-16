class RandomMove
  def new_move(my_id, op_id, field)
    @generator = Generator.new
    @birth = BirthPattern.new
    @cell_checker = CellChecker.new(field)
    @field = field
    @my_id = my_id
    @op_id = op_id
    @my_cells, @op_cells, @empty_cells = get_cells(@my_id, @op_id)
    @kill_cells = (@op_cells + @my_cells).shuffle
    @moves = @my_cells.length >= 2 ? %w(birth kill) : %w(kill)
    @birth_patterns = @birth.birth(field, @cell_checker.get_valid_coordinates)
    generate_move
  end

  def generate_move
    random_moves = []
    best_move = ['pass', -200]
    random_moves << ['pass']
    100.times { random_moves << send(@moves.sample) }
    random_moves.uniq!
    random_moves.each do |move|
      next_gen = @generator.next_generation(apply_move(move))
      score = next_gen.flatten.count(@my_id) - next_gen.flatten.count(@op_id)
      best_move = [move, score] if score > best_move[1]
    end
    p best_move[1]
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
    kill_cell = @kill_cells[0]
    @kill_cells.rotate!(1)
    ['kill', kill_cell]
  end

  def birth
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
