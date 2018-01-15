class FragmentLibrary
  def four_by_four(x, y)
    [
      [x, y], [x + 1, y], [x + 2, y], [x + 3, y],
      [x, y + 1], [x + 3, y + 1], [x, y + 2],
      [x + 3, y + 2], [x, y + 3], [x + 1, y + 3],
      [x + 2, y + 3], [x + 3, y + 3]
    ]
  end
end
