class Bot
  def initialize
    @state = State.new
    @action = Action.new
    @formatter = Formatter.new
    @clock = Clock.new
  end

  def run
    while (line = gets)
      # @clock.start
      line.chomp == '' || parse(line.chomp)
      # p @clock.stop
    end
    run
  end

  private

  def parse(line)
    formatted_line = @formatter.format_input(line)
    case formatted_line.shift
    when 'action'
      print @formatter.format_output(action(formatted_line.last))
    when 'settings', 'update'
      @state.update_info(formatted_line)
    when 'quit'
      exit(true)
    end
  end

  def action(timebank)
    @action.new_action(timebank.to_i, @state.info)
  end
end
