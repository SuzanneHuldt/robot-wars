class FragmentLibrary
  def four_by_four(x, y)
    [
      [x, y], [x + 1, y], [x + 2, y], [x + 3, y],
      [x, y + 1], [x + 3, y + 1],
      [x, y + 2], [x + 3, y + 2],
      [x, y + 3], [x + 1, y + 3], [x + 2, y + 3], [x + 3, y + 3]
    ]
  end

  def five_by_six(x,y)
    [
      [x, y], [x + 1, y], [x + 2, y], [x + 3, y], [x + 4, y],
      [x, y + 1], [x + 4, y + 1],
      [x, y + 2], [x + 4, y + 2],
      [x, y + 3], [x + 4, y + 3],
      [x, y + 4], [x + 4, y + 4],
      [x, y + 5], [x + 1, y + 5], [x + 2, y + 5], [x + 3, y + 5], [x + 4, y + 5]
    ]
  end
end
