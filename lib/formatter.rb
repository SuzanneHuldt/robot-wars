class Formatter
  def format_input(input_line)
    input_line.gsub!(/,/, ' ') if input_line.start_with?('player_names')
    input_line.split(' ')
  end

  def action_format(input_array)
    input_array[2].to_i
  end

  def format_output(output_line)
    # format from Action accordingly
    output_line
  end
end
