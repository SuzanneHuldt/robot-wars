class Action
  def initialize
    @random = RandomMove.new
  end

  def new_action(timebank, info)
    @info = info
    @my_id = @info[:your_botid].to_s
    @op_id = @my_id == '0' ? '1' : '0'
    @random.new_move(@my_id, @op_id, @info[:field])
  end
end
