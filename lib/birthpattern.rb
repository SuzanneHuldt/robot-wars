class BirthPattern

  def find_birth(field)
    a = 0
    while a < 36 do
      x = 0
      y = 0
      z = 1
      while z < 51 do
        if match_square(field,x,y)
          return match_square(field,x,y)
        end
        z += 1
        x += 1
      end
      a += 1
    end
  end

  

  def match_square(field,x,y)
    arr = []
    arr << (clear_horizontal(field,x,y) && clear_horizontal(field, x,(y+3)))
    arr << (clear_vertical(field,x,y) && clear_vertical(field,(x+3),y))
    arr << (two_consecutive(field,x,(y+1)) ^ two_consecutive(field,x,(y+2)))
    arr.include? false ? false : true
  end

  def birth_cell

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
      p hits if hits.length == 2
    end
    hits.length == 2 && hits[1] - hits[0] == 1
  end




end
