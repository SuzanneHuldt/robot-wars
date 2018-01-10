class Bot
  attr_reader :line

  def receive_string
    @input_string = gets.chomp
  end

  def output_string
    print @input_string
  end

  def update_state(formatted_string)
    formatted_string
    #send string to state
    
  end

  def format_string(input_string)
    @line = input_string.split(' ')
  end


end
