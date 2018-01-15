class RandomMove
    MOVES = %w(birth kill pass)

    def new_move(my_id, op_id, board)
      @board = board
      @my_cells, @op_cells, @empty_cells = get_cells(my_id, op_id)
      move = @my_cells.length >= 2 ? MOVES.sample : MOVES[1..-1].sample
      self.send(move)
    end

    def kill
      ['kill', @op_cells.sample]
    end

    def birth
      @my_cells.shuffle!
      ['birth', @empty_cells.sample, @my_cells.shift, @my_cells.shift]

    end

    def pass
      ['pass']
    end

    def get_cells(my_id, op_id)
      [filter_cells(my_id), filter_cells(op_id), filter_cells('.')]
    end

    def filter_cells(id)
      cells = []
      @board.each_with_index do |row, y|
        row.each_with_index do |cell, x|
          cells << "#{x},#{y}" if cell == id
        end
      end
      cells
    end
end