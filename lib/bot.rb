class Bot
  def initialize
    # @settings = {}
  end

  def receive
    @input_string = gets.chomp
  end

  def return_string
    print @input_string
  end
end
