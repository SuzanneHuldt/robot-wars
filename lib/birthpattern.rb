class BirthPattern

  def birth(field)
    birth_cell(@hits) if find_birth(field,0,0)  
  end

  def find_birth(field,x,y)
    while y < 14 do
      while x < 16 do
      y = 0
      return match_square(field,x,y)
      x+=1
      end
      y +=1
    end
  end

  def birth_cell(hits)
    var = hits.sample
    x = var[0].to_i
    y = var[2].to_i + 1
    cell = "#{x},#{y}"
  end


  def match_square(field,x,y)
    arr = []
    arr << (clear_horizontal(field,x,y) && clear_horizontal(field, x,(y+3)))
    arr << (two_consecutive(field,x,(y+1)) ^ two_consecutive(field,x,(y+2)))
    arr.include? false ? false : true
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

  def two_consecutive(field, x, y)
    @hits = []
    z = 1
    while z < 5 do
      x += 1
      z += 1
      @hits << "#{x},#{y}" if field[y][x] == "0"
    end
    @hits.length == 2 && @hits[1][0].to_i - @hits[0][0].to_i == 1
  end
end
