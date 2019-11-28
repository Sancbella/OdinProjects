class Board

  attr_accessor :grid

  def initialize(columns_count: 8, rows_count: 8)
    @grid = rows_count.times.map.with_index do |n, i| 
      n = [0] * columns_count
      n.map.with_index { |c , p| c =  [ "#{i+1}" + "#{(p+97).chr }"].join } 
    end
  end

  def display_grid
    puts "  a b c d e f g h"
    @grid.each.with_index do |r , i| 
      if i % 2 == 1 
      puts "#{ ( i-8 ).abs }" + "#{[176.chr, 178.chr, 176.chr, 178.chr, 176.chr, 178.chr, 176.chr, 178.chr]}" + "#{ ( i - 8 ).abs }"
      else
        puts "#{ ( i-8 ).abs }" + "#{[178.chr, 176.chr, 178.chr, 176.chr, 178.chr, 176.chr, 178.chr, 176.chr]}" + "#{ ( i - 8 ).abs }"
      end
    end
    puts "  a b c d e f g h"
  end
end

game = Board.new

game.display_grid

## FIX THE OUTPUT look here: https://rossta.net/blog/what-is-enumerator.html