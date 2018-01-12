require './lib/state/state.rb'

class LegalMove

  def legal?(move, field, owner = nil)
    return legal_kill(move, field) if move.class == String && move != 'pass'
    return legal_birth(owner, move, field) if move.class == Array
    true
  end

  private

  def legal_kill(move, field)
    filled_cell(move, field)
  end

  def legal_birth(owner, moves, field)
    (owned_cell(owner, moves[1], field) && owned_cell(owner, moves[2], field)) && empty_cell(moves[0], field)
  end

  def filled_cell(move, field)
    get_coordinates(move, field)
    match_cell != '.'
  end

  def owned_cell(owner, move, field)
    get_coordinates(move, field)
    match_cell == owner
  end

  def empty_cell(move, field)
    get_coordinates(move, field)
    match_cell == '.'
  end

  def match_cell
    @y_axis[@x]
  end

  def get_coordinates(move, field)
    move = move.split(',')
    @x = (((move[0]).to_i)-1)
    @y = (((move[1]).to_i)-1)
    @y_axis = field[@y]
  end
end
