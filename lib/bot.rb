class Bot
  def initialize
    @state = State.new
    @action = Action.new
  end

  def run
    line = gets.chomp
    exit(true) if line == 'quit'
    parse(Formatter.format_input(line))
    run
  end

  private

  def parse(formatted_line)
    case formatted_line.shift
      when 'action'
        print Formatter.format_output(action(formatted_line.last.to_i))
      when 'settings', 'update'
        @state.update_info(formatted_line)
      else
        puts 'Please refrain from inputting invalid inputs'
    end
  end

  def action(timebank)
    @action.new_action(timebank, @state.info)
  end
end
