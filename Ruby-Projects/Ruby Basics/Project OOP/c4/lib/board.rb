class Board
  attr_accessor :grid

  def initialize(column_count: 7, rows_count: 6)
    #sets all of the cells to zero, and each row, it maps set col nums
    @grid = rows_count.times.map do |i|
      [0] * column_count
    end
  end

  def is_playable?
    #takes and checks if any rows have any cells that are == to 0 
    #also checks to see if the game isn't won
    @grid.any? { |row| row.any? { |cell| cell == 0 } } && !won?
  end

  def won?
    #cycles through all win types; horiz, vert, diag
    won_horizontally? || won_vertically? || won_diagonally?
  end

  def won_horizontally?
    #checks to see if any of the generated consecutive arrays sum to the absolute number of 4
    @grid.any? { |row| row.each_cons(4).to_a.any? {|e| e.sum.abs == 4} }
  end

  def won_vertically?
    #transposes the grid (pivots) and then runs the check of horizontal win
    @grid.transpose.any? { |row| row.each_cons(4).to_a.any? { |cons_array| cons_array.sum.abs == 4 } }
  end

  def won_diagonally?
    #maps the grid with an interator of the row. With each row, it rotates the rows columns 
    # by the iterator. Then it transposes the grid to horiz then checks for win
    #This is for normal diagonal
    @grid.map.with_index{ |row , i| row.rotate(i) }.transpose.any? { |row| row.each_cons(4).to_a.any?  { |cons_array| cons_array.sum.abs == 4 } } ||
      @grid.map.with_index{ |row, i| row.rotate(-i) }.transpose.any? { |row| row.each_cons(4).to_a.any? { |cons_array| cons_array.sum.abs == 4 } }
    #this is for rev diagonal ^^
  end

  def draw?
    #it's a draw if there's no more playable and no one has won
    !is_playable? && !won?
  end

  def column_can_be_played?(column)
    [1,2,3,4,5,6,7].include?(column) && #checks to see if number falls within 1-7
      @grid.any? { |row| row[column - 1] == 0 } #checks to see if any space == 0
  end

  def display
    puts "+++++++++++++++++++++++++++++++"
    puts "+ 1 + 2 + 3 + 4 + 5 + 6 + 7 ++"
    puts "+++++++++++++++++++++++++++++++"
    @grid.each do |row| 
      print "||"
      ##maps blank if cell == 0, if not...
      #if 1, then maps X, if not then maps O inside 
      #joins array with a " | "
      print row.map { |c| c == 0 ? " " : (c == 1 ? "X" : "O") }.join(" | ")
      print "||"
      puts ""
    end
    puts "++++++++++++++++++++++++++++++++"
  end
end