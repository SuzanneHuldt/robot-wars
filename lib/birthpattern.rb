class BirthPattern

  def birth(field, array)
    moves = []
    moves << birth_cell_horizontal(@hits) if find_birth_horizontal(field, array)
    moves << birth_cell_vertical(@hits) if find_birth_vertical(field, array)
  end

  def find_birth_horizontal(field, array)
    for i in array
      return match_square_horizontal(field, get_x(i), get_y(i))
    end
  end

  def find_birth_vertical(field, array)
    for i in array
      return match_square_vertical(field, get_x(i), get_y(i))
    end
  end

  def get_x(sub_array)
    sub_array[0]
  end

  def get_y(sub_array)
    sub_array[1]
  end

  def birth_cell_horizontal(hits)
    var = hits.sample
    x = var[0].to_i
    y = var[2].to_i + 1
    cell = "#{x},#{y}"
  end

  def birth_cell_vertical(hits)
    var = hits.sample
    x = var[0].to_i + 1
    y = var[2].to_i
    cell = "#{x},#{y}"
  end


  def match_square_horizontal(field,x,y)
    arr = []
    arr << (clear_horizontal(field,x,y) && clear_horizontal(field, x,(y+3)))
    arr << (two_consecutive_across(field,x,(y+1)) ^ two_consecutive_across(field,x,(y+2)))
    arr.include? false ? false : true
  end

  def match_square_vertical(field,x,y)
    arr = []
    arr << (clear_vertical(field,x,y) && clear_vertical(field, (x+3),y))
    arr << (two_consecutive_up(field,(x+1),y) ^ two_consecutive_up(field,(x+2),y))
    p arr
    if arr.include? false
      false
    else
      true
    end
  #  arr.include? false ? false : true
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

  def two_consecutive_across(field, x, y)
    @hits = []
    z = 1
    while z < 5 do
      x += 1
      z += 1
      @hits << "#{x},#{y}" if field[y][x] == "0"
    end
    @hits.length == 2 && @hits[1][0].to_i - @hits[0][0].to_i == 1
  end

  def two_consecutive_up(field, x, y)
    @hits = []
    z = 1
    while z < 5 do
      y += 1
      z += 1
      @hits << "#{x},#{y}" if field[y][x] == "0"
    end
    @hits.length == 2 && @hits[1][2].to_i - @hits[0][2].to_i == 1
  end
end
