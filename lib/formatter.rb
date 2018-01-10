class Formatter
  attr_reader :line

  def format_input(input_line)
    @line = input_line.split(' ')
  end

  def format_output(output_line)
    output_line
  end
end
