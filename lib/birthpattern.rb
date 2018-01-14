class BirthPattern

  attr_reader :a
  def initialize

  end

  def match_square(field,x,y)
    break if clear_horizontal(field,x,y) != true
    break if clear_vertical(field,x,y) != true
    break if clear_horizontal(field,x,(y+2)) != true
    break if clear_vertical(field,(x+3),y) != true
    two_consecutive(field,x,(y+1))
  end


  def clear_horizontal(field, x, y)
    hits = []
    z = 1
    while z < 5 do
      x += 1
      z += 1
      hits << field[y][x] if field[y][x] != "."
    end
    hits.length == 0
  end

  def clear_vertical(field, x, y)
    hits = []
    z = 1
    while z < 5 do
      y += 1
      z += 1
      hits << field[y][x] if field[y][x] != "."
    end
    hits.length == 0
  end

  def two_consecutive(field, x, y)
    hits = []
    z = 1
    while z < 5 do
      x += 1
      z += 1
      hits << x if field[y][x] == "0"
    end
    hits.length == 2 && hits[1] - hits[0] == 1
  end




end
