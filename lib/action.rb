class Action
  def initialize
    @random = RandomMove.new
    @clock = Clock.new
  end

  def new_action(timebank, info)
    update_info(timebank, info)
    make_move
  end

  private

  def update_info(timebank, info)
    @info = info
    @timebank = timebank
    @my_id = @info[:your_botid].to_s
    @op_id = @my_id == '0' ? '1' : '0'
  end

  def make_move
    @clock.start
    move = new_move
    make_move if check_time(@clock.stop)
    move
  end

  def check_time(move_time)
    @timebank -= move_time
    return true if time_to_spend?(@timebank, move_time)
    false
  end

  def time_to_spend?(timebank, move_time)
    @timebank > move_time && [false, true].sample
  end

  def new_move
    @random.new_move(@my_id, @op_id, @info[:field])
  end
end
