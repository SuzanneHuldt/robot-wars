class Pattern

  def initialize(y, x)
    @y = y
    @x = x
    @pattern = KillTemplate.new.next_gen_square(@x, @y)

  end

  def build
    variations = []
    @pattern.each do |variation|
      variations << variation
    end
  end
end
