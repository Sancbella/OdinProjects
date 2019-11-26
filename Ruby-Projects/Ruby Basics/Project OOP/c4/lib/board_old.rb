class Board
  attr_accessor :board
  def initialize
    @board = [
    ['*','*','*','*','*','*','*'],
    ['*','*','*','*','*','*','*'],
    ['*','*','*','*','*','*','*'],
    ['*','*','*','*','*','*','*'],
    ['*','*','*','*','*','*','*'],
    ['*','*','*','*','*','*','*'],
    ['1','2','3','4','5','6','7']
  ]
  end
  def display
    @board.each {|row| 
      row.each {|cell| print "#{cell.to_s}" + " "}
      puts"\n"}
  end
  def board
    @board
  end

end