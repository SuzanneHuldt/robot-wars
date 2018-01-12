class Formatter
  def format_input(input_line)
    input_line.tr!(',', ' ') if input_line.include?('player_names')
    input_line.delete!(',') if input_line.include?('game board')
    input_line.split(' ')
  end

  def format_output(action)
    action.join(' ') + "\n"
  end
end
