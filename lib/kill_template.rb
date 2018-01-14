class KillTemplate
  def next_gen_square(x, y)
    [
      [[x, y], [x + 1, y], [x, y + 1]],
      [[x, y], [x + 1, y], [x + 1, y + 1]],
      [[x, y], [x - 1, y + 1], [x, y + 1]],
      [[x, y], [x, y + 1], [x + 1, y + 1]]
    ]
  end
end
