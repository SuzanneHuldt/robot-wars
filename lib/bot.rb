class Bot
  attr_reader :line, :action, :state

  def initialize
    #these arrays exist only for test purposes
    @action = []
    @state = []
  end


  def receive_string
    @input_string = gets.chomp
  end

  def output_string
    print @input_string
  end

  def update_state(formatted_string)
    #these arrays only exist so that we can test the consider
    #the tests must be rewritten to test implementation when we
    #link up with your state class and when we write action class
    case 
    when action_test(formatted_string)
      @action << formatted_string
    else
      @state << formatted_string
    end
  end

  def format_string(input_string)
    @line = input_string.split(' ')
  end

  def action_test(formatted_string)
    formatted_string[0] == 'action'
  end

end
