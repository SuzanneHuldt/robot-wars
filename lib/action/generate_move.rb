class GenerateMove
  MOVES = ['birth', 'kill', 'pass']

  def initialize(hash)
    @game_state = hash
  end

  def random_move
    move_type = generate_action
    return 'pass' if move_type == 'pass'
    return assign_kill_coordinates if move_type == 'kill'
    return assign_birth_coordinates if move_type == 'birth'
  end

  private

  def generate_action
    MOVES.sample
  end

  def assign_kill_coordinates
    assign_coordinates
  end

  def assign_birth_coordinates
    coordinates = []
    until coordinates.length == 3 do
      new_coordinates = assign_coordinates
      coordinates << new_coordinates unless coordinates.include? new_coordinates
    end
    coordinates
  end

  def assign_coordinates
    y = rand(@game_state[:field_height])
    x = rand(@game_state[:field_width])
    return "#{y},#{x}"
  end
end

