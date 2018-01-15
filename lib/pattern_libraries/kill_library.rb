class KillTemplate
  def all_patterns(x, y)
    patterns = []
    patterns << next_gen_square(x, y)
    patterns << tub(x, y)
    patterns << beehive(x, y)
    patterns << blinker(x, y)
    patterns << package(x, y)
    patterns << boat(x, y)
    patterns << ship(x, y)
    patterns << loaf(x, y)
  end

  def next_gen_square(x, y)
    [
      [[x, y], [x + 1, y], [x, y + 1]],
      [[x, y], [x + 1, y], [x + 1, y + 1]],
      [[x, y], [x - 1, y + 1], [x, y + 1]],
      [[x, y], [x, y + 1], [x + 1, y + 1]]
    ]
  end

  def tub(x, y)
    [
      [[x, y], [x - 1, y + 1], [x + 1, y + 1], [x, y + 2]]
    ]
  end

  def beehive(x, y)
    [
      [[x, y], [x - 1, y + 1], [x +1, y + 1], [x - 1, y + 2], [x + 1, y + 2], [x, y + 3]],
      [[x, y], [x + 1, y], [x - 1, y + 1], [x +2, y + 1], [x, y + 2], [x + 1, y + 2]]
    ]
  end

  def blinker(x, y)
    [
      [[x, y], [x, y + 1], [x, y + 2]],
      [[x, y], [x + 1, y], [x + 2, y]]
    ]
  end

  def package(x, y)
    [
      [[x, y], [x + 1, y], [x - 1, y + 1], [x + 2, y + 1], [x - 1, y + 2], [x + 2, y + 2], [x, y + 3], [x + 1, y +3]]
    ]
  end

  def boat(x, y)
    [
      [[x, y], [x + 1, y], [x, y + 1], [x + 2, y + 1], [x + 1, y + 2]],
      [[x, y], [x + 1, y], [x - 1, y + 1], [x + 1, y + 1], [x, y + 2]],
      [[x, y], [x - 1, y + 1], [x + 1, y + 1], [x, y + 2], [x + 1, y + 2]],
      [[x, y], [x - 1, y + 1], [x + 1, y + 1], [x - 1, y + 2], [x, y + 2]]
    ]
  end

  def ship(x, y)
    [
      [[x, y], [x + 1, y], [x, y + 1], [x + 2, y + 1], [x + 1, y + 2], [x + 2, y +2]],
      [[x, y], [x + 1, y], [x - 1, y + 1], [x + 1, y + 1], [x - 1, y + 2], [x, y + 2]]
    ]
  end

  def loaf(x, y)
    [
      [[x, y], [x + 1, y], [x - 1, y + 1], [x + 2, y + 1], [x - 1, y + 2], [x + 1, y + 2], [x, y + 3]],
      [[x, y], [x + 1, y], [x - 1, y + 1], [x + 2, y + 1], [x, y + 2], [x + 2, y + 2], [x + 1, y + 3]],
      [[x, y], [x -1, y + 1], [x + 1, y + 1], [x - 2, y + 2], [x + 1, y + 2], [x - 1, y + 3], [x, y + 3]],
      [[x, y], [x - 1, y + 1], [x + 1, y + 1], [x - 1, y + 2], [x + 2, y + 2], [x, y + 3], [x + 1, y + 3]]
    ]
  end
end
