class Action
  MOVES = ['birth', 'kill', 'pass']

  def new_action(t, hash)
    # t = time
    # true
    generate_move(hash)

  end

  def legal_move(move, hash)

    # returns boolean
  end

  def generate_move(hash)
    # generate_move.new()
    move = MOVES.sample
    return move if move == 'pass'
    return assign_kill_coordinates(hash) if move == 'kill'
    # code to generate a move
    # move = (GENERATED_MOVE)
    # return generate_move(hash) unless legal_move(move, hash)
    move
  end

  def export_move(move)

  end


  def on_board(move, hash)
    # for now this functionality exists within the generate move method (for random move only)
    # it will be scooped into the legal move class eventually
    # always the same
  end

  def legal_cell(move, hash)
    # going to differ depending on move type
  end

  private

  def assign_kill_coordinates(hash)

  end


end
