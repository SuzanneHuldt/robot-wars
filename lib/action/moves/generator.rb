class Generator
  def next_generation(field)
    @field = field
    @next_gen = []
    @field.each_with_index do |row, x|
      new_row = []
      row.each_with_index do |cell, y|
        new_row << new_state(cell, neighbours(x,y))
        end
      @next_gen << new_row
    end
    @next_gen
  end

  private

  def neighbours(x, y)
    neighbours_list = []
    (x-1..x+1).each do |row|
      (y-1..y+1).each do |column|
        next if row == x && column == y
        next if @field[row].nil?
        next if @field[row][column].nil?
        neighbours_list << @field[row][column]
      end
    end
    neighbours_list.reject { |value| value == '.' }
  end

  def new_state(cell, neighbours)
    return '.' if neighbours.nil? || neighbours.length < 2 || neighbours.length > 3
    return neighbours.max_by { |i| neighbours.count(i) } if cell == '.' && neighbours.length == 3
    cell
  end
end
