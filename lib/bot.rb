class Bot
  attr_reader :line, :action, :state

  def initialize
    @action = Action.new
    @state = State.new
    @formatter = Formatter.new
  end

  def run
    input = (gets || '').chomp
    return run if input == ''
    exit(true) if input == 'quit'
    update(format_string(input))
    run
  end

  def output_string(string)
    print string
  end

  def update(formatted_string)
    case
    when action_test(formatted_string)
      output_string(@action.new_action(@formatter.action_format(formatted_string), @state.info))
    else
      @state.update_info(formatted_string)
    end
  end

  def format_string(input_string)
    @formatter.format_input(input_string)
  end

  def action_test(formatted_string)
    formatted_string.shift == 'action'
  end
end
