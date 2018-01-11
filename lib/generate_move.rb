class GenerateMove
  attr_reader :game_state

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

  def generate_action
    MOVES.sample
  end

  def assign_kill_coordinates
    "#{rand(@game_state[:field_height])},#{rand(@game_state[:field_width])}"
  end

  def assign_birth_coordinates
    [ "#{rand(@game_state[:field_height])},#{rand(@game_state[:field_width])}",
      "#{rand(@game_state[:field_height])},#{rand(@game_state[:field_width])}",
      "#{rand(@game_state[:field_height])},#{rand(@game_state[:field_width])}" ]
  end
end
