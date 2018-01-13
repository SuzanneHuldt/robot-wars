class Pattern

  def initialize(y, x)
    @y = y
    @x = x
  end

  def build
    variations = []
    variations << [[@x, @y], [@x + 1, @y], [@x, @y + 1]]
    variations << [[@x, @y], [@x + 1, @y], [@x + 1, @y + 1]]
    variations << [[@x, @y], [@x - 1, @y + 1], [@x, @y + 1]]
    variations << [[@x, @y], [@x, @y + 1], [@x + 1, @y + 1]]
    variations
  end
end
