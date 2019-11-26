class Player
  attr_accessor :name, :symbol

  def initialize(name: name, symbol: symbol)
    @name = name
    @symbol = symbol
  end

  def play_column(board, column)
    board.grid.each_with_index do |row, i|
      system("clear")
      puts "The board is now:"
      board.display_grid
      sleep 0.25

      if row[column-1] == 0
        board.grid[[0, i-1].max][column-1] = 0
        board.grid[i][column-1] = self.symbol
      else
        next
      end
    end
  end
end
