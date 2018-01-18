class Formatter
  def format_input(input_line)
    input_line.tr!(',', ' ') if input_line.include?('player_names')
    input_line.delete!(',') if input_line.include?('game field')
    input_line.split(' ')
  end

  def format_output(action)
    case action.shift
    when 'pass'
      return "pass\n"
    when 'kill'
      return "kill #{to_coordinates(action[0])}\n"
    when 'birth'
      return "birth #{to_coordinates(action[0])} #{to_coordinates(action[1])} #{to_coordinates(action[2])}\n"
    end
  end

  def to_coordinates(cell)
    "#{cell[1]},#{cell[0]}"
  end
end

