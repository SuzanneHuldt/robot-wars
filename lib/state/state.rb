class State
  attr_reader :info

  def initialize
    @info = {}
  end

  def update_info(args)
    return handle_game(args) if args[0] == 'game'
    @info[args[0].to_sym] = args[1].to_i
  end

  private

  def handle_game(args)
    return update_info(args[1..-1]) if args[1] == 'round'
    handle_field(args[-1])
  end

  def handle_field(arg)
    return if arg == ''
    @info[:field] ||= []
    @info[:field] << arg.slice!(0...@info[:field_width]).chars
    handle_field(arg)
  end
end


=begin
 
 settings:
  timebank t
  time_per_move t
  player_names player0,player1
  your_bot player0
  your_botid 0
  field_width 18
  field_height 16
  max_rounds 100

  update:
    game round 0
    game field .,.,.,1,.,0,.,.,.,.,.,0,.,1,.,.,1,.,.,.,.,.,.,.,0,.,.,1,1,.,.,.,1,1,.,.,0,.,.,.,0,.,.,0,1,0,1,.,.,.,1,.,.,.,1,.,.,.,.,1,.,0,.,.,1,.,0,.,1,.,1,1,.,1,.,1,.,.,0,1,.,0,.,0,.,0,.,.,.,1,1,.,.,.,.,0,.,.,1,.,.,.,.,.,0,.,0,1,0,.,.,.,.,.,.,1,.,1,0,.,1,0,.,.,.,.,.,0,.,.,.,.,.,.,1,.,.,.,.,.,1,.,0,1,0,1,.,0,.,.,.,.,.,0,.,.,.,.,.,.,1,.,.,.,.,.,1,0,.,1,0,.,0,.,.,.,.,.,.,1,0,1,.,1,.,.,.,.,.,0,.,.,1,.,.,.,.,0,0,.,.,.,1,.,1,.,1,.,0,1,.,.,0,.,0,.,0,0,.,0,.,1,.,0,.,.,1,.,0,.,.,.,.,0,.,.,.,0,.,.,.,0,1,0,1,.,.,1,.,.,.,1,.,.,0,0,.,.,.,0,0,.,.,1,.,.,.,.,.,.,.,0,.,.,0,.,1,.,.,.,.,.,1,.,0,.,.,.
    player0 living_cells 50
    player1 living_cells 50
=end