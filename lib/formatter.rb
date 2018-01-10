class Formatter
  attr_reader :line

  def format_input(input_line)
    @line = input_line.split(' ')
  end

  def action_format(input_array)
    input_array[2].to_i
  end

  def format_output(output_line)
    # format from Action accordingly
    output_line
  end
end
