class FragmentLibrary

  def all_fragments(x, y)
    fragments = []
    fragments << four_by_four(x, y)
    fragments << five_by_five(x,y)
    fragments << five_by_six(x,y)
    fragments << six_by_five(x,y)
    fragments << six_by_six(x,y)
  end

  def four_by_four(x, y)
    [[
      [x, y], [x + 1, y], [x + 2, y], [x + 3, y],
      [x, y + 1], [x + 3, y + 1],
      [x, y + 2], [x + 3, y + 2],
      [x, y + 3], [x + 1, y + 3], [x + 2, y + 3], [x + 3, y + 3]
    ],[2, 2]]
  end

  def five_by_six(x,y)
    [[
      [x, y], [x + 1, y], [x + 2, y], [x + 3, y], [x + 4, y],
      [x, y + 1], [x + 4, y + 1],
      [x, y + 2], [x + 4, y + 2],
      [x, y + 3], [x + 4, y + 3],
      [x, y + 4], [x + 4, y + 4],
      [x, y + 5], [x + 1, y + 5], [x + 2, y + 5], [x + 3, y + 5], [x + 4, y + 5]
    ],[3, 4]]
  end

  def six_by_five(x,y)
    [[
      [x, y], [x + 1, y], [x + 2, y], [x + 3, y], [x + 4, y], [x + 5, y],
      [x, y + 1], [x + 5, y + 1],
      [x, y + 2], [x + 5, y + 2],
      [x, y + 3], [x + 5, y + 3],
      [x, y + 4], [x + 1, y + 4], [x + 2, y + 4], [x + 3, y + 4],
      [x + 4, y + 4], [x + 5, y + 4]
    ],[4, 3]]
  end

  def five_by_five(x,y)
    [[
      [x, y], [x + 1, y], [x + 2, y], [x + 3, y], [x + 4, y],
      [x, y + 1], [x + 4, y + 1],
      [x, y + 2], [x + 4, y + 2],
      [x, y + 3], [x + 4, y + 3],
      [x, y + 4], [x + 1, y + 4], [x + 2, y + 4], [x + 3, y + 4], [x + 4, y + 4]
    ],[3, 3]]
  end

  def six_by_six(x,y)
    [[
      [x, y], [x + 1, y], [x + 2, y], [x + 3, y], [x + 4, y], [x + 5, y],
      [x, y + 1], [x + 5, y + 1],
      [x, y + 2], [x + 5, y + 2],
      [x, y + 3], [x + 5, y + 3],
      [x, y + 4], [x + 5, y + 4],
      [x, y + 5], [x + 1, y + 5], [x + 2, y + 5], [x + 3, y + 5],
      [x + 4, y + 5], [x + 5, y + 5]
    ], [4, 4]]
  end
end
