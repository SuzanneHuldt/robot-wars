require 'action.rb'
require 'state.rb'

class Bot
  attr_reader :line, :action, :state

  def initialize
    @action = Action.new
    @state = State.new
  end

  def receive_string
    @input_string = gets.chomp
  end

  def output_string
    print @input_string
  end

  def update(formatted_string)
    case
    when action_test(formatted_string)
      @action.update(formatted_string)
    else
      @state.update(formatted_string)
    end
  end

  def format_string(input_string)
    @line = input_string.split(' ')
  end

  def action_test(formatted_string)
    formatted_string[0] == 'action'
  end

end
