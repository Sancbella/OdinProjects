class Player
  attr_accessor :name, :symbol
  def initialize (name: name, symbol: symbol)
    @name = name
    @symbol = symbol
  end

  def play_column(board, column)
    board.grid.each_with_index do |row , i|  #takes the grid of the board 
      system("clear") #clears the system
      board.display #puts the new board
      if row[column-1] == 0 #if the cell == 0
        board.grid[[0,i-1].max][column-1] = 0 # the grid [index of the row (above 0)][column] will equal 0
        board.grid[i][column-1] = self.symbol  # the grid of [index of row][column] = self.symbol
      else
        next  #if not then moves on
      end
    end
  end
end