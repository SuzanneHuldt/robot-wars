class Pattern

  def initialize(y, x)
    @y = y
    @x = x
    @pattern = [
      [[@x, @y], [@x + 1, @y], [@x, @y + 1]],
      [[@x, @y], [@x + 1, @y], [@x + 1, @y + 1]],
      [[@x, @y], [@x - 1, @y + 1], [@x, @y + 1]],
      [[@x, @y], [@x, @y + 1], [@x + 1, @y + 1]]
    ]

  end

  def build
    variations = []
    @pattern.each do |variation|
      variations << variation
    end
  end
end
