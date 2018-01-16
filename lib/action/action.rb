class Action
  def initialize
    @random = RandomMove.new
  end

  def new_action(timebank, info)
    update_info(timebank, info)
    @random.new_move(@my_id, @op_id, @info[:field])
  end

  private

  def update_info(timebank, info)
    @info = info
    @timebank = timebank
    @my_id = @info[:your_botid].to_s
    @op_id = @my_id == '0' ? '1' : '0'
  end
end
