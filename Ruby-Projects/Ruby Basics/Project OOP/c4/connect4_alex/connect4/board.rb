class Board
  attr_accessor :grid

  def initialize(column_count: 7, rows_count: 6)
    @grid = rows_count.times.map do |i|
      [0] * column_count
    end
  end

  def is_playable?
    @grid.any? { |row| row.any? { |cell| cell == 0 } } && !won?
  end

  def won?
    won_horizontally? || won_vertically? || won_diagonally?
  end

  def won_horizontally?
    @grid.any? { |row| row.each_cons(4).to_a.any? { |e| e.sum.abs == 4 } }
  end

  def won_vertically?
    @grid.transpose.any? { |row| row.each_cons(4).to_a.any? { |e| e.sum.abs == 4 } }
  end

  def won_diagonally?
    @grid.map.with_index { |row, i| row.rotate(i) }.transpose.any? { |row| row.each_cons(4).to_a.any? { |e| e.sum.abs == 4 } } ||
      @grid.map.with_index { |row, i| row.rotate(-i) }.transpose.any? { |row| row.each_cons(4).to_a.any? { |e| e.sum.abs == 4 } }
  end

  def draw?
    !is_playable? && !won?
  end

  def column_can_be_played?(column)
    [1,2,3,4,5,6,7].include?(column) &&
      @grid.any? { |row| row[column-1] == 0 }
  end

  def display_grid
    puts "==============================="
    puts "== 1 = 2 = 3 = 4 = 5 = 6 = 7 =="
    puts "==============================="
    @grid.each do |row|
      print "|| "
      print row.map { |e| e == 0 ? " " : (e == 1 ? "X" : "O") }.join(" | ")
      print " ||"
      puts ""
    end
    puts "==============================="
  end
end
