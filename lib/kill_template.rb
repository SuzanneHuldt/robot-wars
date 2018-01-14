class KillTemplate
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
end
