require 'action.rb'
require 'state/state.rb'
require 'formatter.rb'

class Bot
  attr_reader :line, :action, :state

  def initialize
    @action = Action.new
    @state = State.new
    @formatter = Formatter.new
  end

  def run
    update(format_string(receive_string))
    #output_string
    run
  end

  def receive_string
    @input_string = gets.chomp
  end

  def output_string
    # receive from Action
    # needs to call Format_output on Formatter
    print @input_string
  end

  def update(formatted_string)
    case
    when action_test(formatted_string)
      @action.new_action(@formatter.action_format(formatted_string), @state.info )
    else
      @state.update_info(formatted_string)
    end
  end

  def format_string(input_string)
    @formatter.format_input(input_string)
  end

  def action_test(formatted_string)
    formatted_string[0] == 'action'
  end
end
