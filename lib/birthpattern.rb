class BirthPattern

  attr_reader :a
  def initialize

  end

  def match(field)

  end

  #get rid
  def set_start(field, x, y)
    @a = field[y][x]
  end

  def clear_horizontal(field, x, y)
    hits = []
    z = 1
    while z < 5 do
      x += 1
      z += 1
      hits << "hit" if field[y][x] != "."
    end
    hits.length == 0
  end

  def clear_vertical(field, x, y)
    hits = []
    z = 1
    while z < 5 do
      y += 1
      z += 1
      hits << "hit" if field[y][x] != "."
    end
    hits.length == 0
  end

  


end
