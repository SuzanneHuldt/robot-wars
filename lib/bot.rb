require 'legalmove.rb'

class Bot
  def initialize
    @state = State.new
    @action = Action.new
    @formatter = Formatter.new
  end

  def run
    line = gets.chomp
    return if line == 'quit'
    parse(@formatter.format_input(line))
  end

  private

  def parse(formatted_line)
    case formatted_line.shift
    when 'action'
      print @formatter.format_output(action(formatted_line.last))
    when 'settings', 'update'
      @state.update_info(formatted_line)
    else
      puts 'Please refrain from inputting invalid inputs'
    end
    run
  end

  def action(timebank)
    @action.new_action(timebank.to_i, @state.info)
  end
end
