class GenerateMove
  attr_reader :game_state

  MOVES = ['birth', 'kill', 'pass']

  def initialize(hash)
    @game_state = hash
  end

  def generate
    move_type = MOVES.sample
  end
end
