class State
  attr_reader :info

  def initialize
    @info = {
      me: Player.new,
      opponent: Player.new
    }
  end

  def update_info(args)
    return handle_game(args) if args[0] == 'game'
    return assign_your_bot(args) if args[0] == 'your_bot'
    return handle_player(args) if args[0].include?('player')
    @info[args[0].to_sym] = args[1].to_i
  end

  private

  def handle_game(args)
    return update_info(args[1..-1]) if args[1] == 'round'
    handle_field(args[-1])
  end

  def handle_field(arg)
    @info[:field] = []
    parse_field(arg)
  end

  def parse_field(arg)
    return if arg == ''
    @info[:field] << arg.slice!(0...@info[:field_width]).chars
    parse_field(arg)
  end

  def assign_your_bot(args)
    @info[args[0].to_sym] = args[1]
  end

  def handle_player(args)
    return update_living_cells(args) if args[1] == 'living_cells'
    return update_last_move(args) if args[1] == 'move'
    update_player_names(args)
  end

  def update_living_cells(args)
    return @info[:me].update_living_cells(args[2].to_i) if args[0] == @info[:your_bot]
    @info[:opponent].update_living_cells(args[2].to_i)
  end

  def update_last_move(args)
    @info[:opponent].update_last_move(args[2])
  end

  def update_player_names(args)
    @info[:me].update_name(args[1])
    @info[:opponent].update_name(args[2])
  end
end
