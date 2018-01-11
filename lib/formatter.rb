class Formatter
  class << self
    def format_input(input_line)
      input_line.gsub!(/,/, ' ') if input_line.start_with?('player_names')
      input_line.split(' ')
    end

    def format_output(action)
      action.join(' ') + "\n"
    end
  end
end
