require './lib/strategy.rb'

class Bot
  def initialize
    p 'Take me to your leader'

    @game_settings = {
      timebank: nil,
      time_per_move: nil,
      player_names: nil,
      your_bot: nil,
      your_botid: nil,
      field_width: nil,
      field_height: nil,
      max_rounds: nil
    }

    @state = {
      field: nil,
      round: 0,
      players: {}
    }

    @strategy = Strategy.new
  end
end
